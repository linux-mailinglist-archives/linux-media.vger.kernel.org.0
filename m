Return-Path: <linux-media+bounces-24762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B27A11E0D
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 10:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C9F3163EA3
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 09:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7AA21EEA5B;
	Wed, 15 Jan 2025 09:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BFhA5pyg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31600243843;
	Wed, 15 Jan 2025 09:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736933530; cv=none; b=gcPeIuorBVxLtjx1ReBOgNMBiA1gj7+9UcGdE3Yv4hqG2IinzYdhqpGHMUP9SgcCDvPd6hJWCEp84pNrBg9g/FwruY7/rBvFWZlaPijNIP3cQJgLXS4QCXpTkQrfzjUQhU1FMlfBPxjIspi4QEcdZzI9E4BWHb8F9E+xXWmA/Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736933530; c=relaxed/simple;
	bh=DI1tSkxAv0Uxhv+EenHTrUbnECoxsKW7Vvxh86Y6R78=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=gP0Q9QmL41F0R9+ODSQTHpwcI9R0GndvKahchurkXbudwarMGI3bgmjjlRTaaoTQXAA9G3BvtWzSzxkfjqrz+K+eCg3xUM0TNJ1PE/K4xbDcjDQSnTGZj0sLWGN14yFOZWqSzYvFqvn83LMN0ynm7KURCRDAVPP6AR8xTh5ZQ0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BFhA5pyg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F8leZA015870;
	Wed, 15 Jan 2025 09:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=G7uwZdOna6jDkyg9O4ck8A
	NCz51I0oS58WUuSPW2VcA=; b=BFhA5pygYdDLnOOy7j4/neq0P5aGFjsbq32PQX
	GXcc3YFhJJrkxmCH5+fCdXVXKyjA8p08McXlEhuhZwJNcYLpOlmGx8ccyC6/usZH
	7tHzAbQFx2xtwSczUj3Bk7q9JrthDXbHY1KAarJ9UmmmUxPxYNV1LyXlO8HFFJrF
	6oW0IjWZGZzvq58vlGwKY0vV1mDwS0cviqZxlK1j6S0HP/JWECquWbSVDFmuatyk
	K5qfE2idLZ6itVLycaH23VlqOAWXH4Hhpaf0sLo472tSJlX2WM0V1IGRQwaAW8ma
	HOAwZI6DPkAM8bLEra7IeHvQ7ArSg1PUhK43cBQ9cu+AO2Yw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4469tpr3ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 09:32:02 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50F9W1a4010693
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 09:32:01 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 Jan 2025 01:31:58 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Subject: [PATCH v3 0/3] Use APIs in gdsc genpd to switch gdsc mode for
 venus v4 core
Date: Wed, 15 Jan 2025 15:00:51 +0530
Message-ID: <20250115-switch_gdsc_mode-v3-0-9a24d2fd724c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEuAh2cC/23OzU7EIBSG4VtpWIvhQPnprLwPYyZwOExZtB2hV
 s2k9y52Fsbo8iPhOe+NVSqZKjt1N1ZoyzUvcxvqoWM4+vlCPMe2mRRSCwDN63tecTxfYsXztET
 ifkDok4+DV4a1b9dCKX8c5PPLfRd6fWvyen9kwVfiuExTXk+dUUGlJFQcwJNLzupEzvYWrQOvJ
 STrMBJY9m2Nua5L+TxqNziwFtYDSPk3bAMuuDI6icEShiCeWgXmGR/b7YPb5A8hpfqHkI2goHE
 wnsgY+ZvY9/0L7ciB7UEBAAA=
X-Change-ID: 20250115-switch_gdsc_mode-a9c14fad9a36
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
	<quic_renjiang@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736933518; l=2915;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=DI1tSkxAv0Uxhv+EenHTrUbnECoxsKW7Vvxh86Y6R78=;
 b=JBT5T1y1cPfVo9BLrcH8/poXUNprsSNO3fa0AkM/XffqOnq96WPEtPKZIODFCUrDWB6N5i54w
 /Qq62Xd2iBKCzgOqXHW2J8LvqmUpuNnY8lPG0/5wRQk9np5yue5skGa
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ob9Hcubth0Q7igIuekZKqLVB822_OFHw
X-Proofpoint-ORIG-GUID: ob9Hcubth0Q7igIuekZKqLVB822_OFHw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_03,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=583 mlxscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150072

The Venus driver requires vcodec GDSC to be ON in SW mode for clock
operations and move it back to HW mode to gain power benefits. Earlier,
as there is no interface to switch the GDSC mode from GenPD framework,
the GDSC is moved to HW control mode as part of GDSC enable callback and
venus driver is writing to its POWER_CONTROL register to keep the GDSC ON
from SW whereever required. But the POWER_CONTROL register addresses are
not constant and can vary across the variants.

Also as per the HW recommendation, the GDSC mode switching needs to be
controlled from respective GDSC register and this is a uniform approach
across all the targets. Hence use dev_pm_genpd_set_hwmode() API which
controls GDSC mode switching using its respective GDSC register.

If only the clock patch or the venus driver patch is merged, the venus
driver will not work properly. Although it does not affect other system
functions, it is still recommended to wait until both the clock patch
and the venus driver patch are reviewed and passed, and then merge them
into the same release by their respective maintainers.

Validated this series on QCS615 and SC7180.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
Changes in v3:
- 1. Update commit message.
- 2. Add a patch to clean up the dead code for the venus driver.
- 3. Remove vcodec_control_v4() function.
- 4. Directly call dev_pm_genpd_set_hwmode() without vcodec_control_v4().
- Link to v2: https://lore.kernel.org/r/20241223-switch_gdsc_mode-v2-0-eb5c96aee662@quicinc.com

Changes in v2:
- 1. Add the HW_CTRL_TRIGGER flag for the targets SM7150/SM8150 and SM8450
video GDSCs supporting movement between HW and SW mode of the GDSC.
(Suggested by Dmitry Baryshkov)
- 2. There is a dependency of the clock driver introducing the new flag
and the video driver adapting to this new API. Missing either the clock
and video driver could potentially break the video driver.
- Link to v1: https://lore.kernel.org/r/20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com

---
Renjiang Han (2):
      venus: pm_helpers: Use dev_pm_genpd_set_hwmode to switch GDSC mode on V4
      venus: pm_helpers: Remove dead code and simplify power management

Taniya Das (1):
      clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for video GDSC's

 drivers/clk/qcom/videocc-sc7180.c              |  2 +-
 drivers/clk/qcom/videocc-sdm845.c              |  4 +-
 drivers/clk/qcom/videocc-sm7150.c              |  4 +-
 drivers/clk/qcom/videocc-sm8150.c              |  4 +-
 drivers/clk/qcom/videocc-sm8450.c              |  4 +-
 drivers/media/platform/qcom/venus/pm_helpers.c | 73 +++-----------------------
 6 files changed, 17 insertions(+), 74 deletions(-)
---
base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
change-id: 20250115-switch_gdsc_mode-a9c14fad9a36

Best regards,
-- 
Renjiang Han <quic_renjiang@quicinc.com>


