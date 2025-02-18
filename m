Return-Path: <linux-media+bounces-26267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DEAA3997A
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 11:47:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8CDD3A89A5
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 10:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E446D23ED78;
	Tue, 18 Feb 2025 10:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fkpb8Cvc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A4F2343BE;
	Tue, 18 Feb 2025 10:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739874831; cv=none; b=UGjnX5UuK5ERFsclSRoeA6AnRtnUCPsAuMlMjb1wV8HcubkJysDbdk3Dbp+pB/q8ykHK7mAhjpHjoOT/jXrqfQuwkBNn0e3Ai96vY1MfRGHgkJ11dh0xlx9V9PBxBtSWnwwUhyJRm+k4iIKGJnjdGWU9nADPD6SjVO+XvEJSmF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739874831; c=relaxed/simple;
	bh=jIS928/9+nt0t4eM/RN2f9Shstwdhs7mzb3JIv7bwE0=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=op5H9c/uIoqmdWxysHL9POJRgtHqQvThpGpEqMJTAf921maduSlStEd6+h9N+DqI5qgPRm6Knj7RoRtUxSlhOTkv2G6z7PAVDP+XX4D39iu/R2SEsx5FAL2hq47MgyNHCtYsU24LHZTqYCfLGFTvA13yHVEItQn6UD4xB6Go6aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fkpb8Cvc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51I2Cl7S004084;
	Tue, 18 Feb 2025 10:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YWzaNOGXXQ0S38zSsOMjau
	KMklF/9FuH0uqw/RbfIaY=; b=fkpb8Cvc7+Xmfsx4NdDZ89MQfrQ69/+W3Fz6CV
	HFbQDouyCNN4ehb48TxSPQSdJ90lKkR2Ce2dWtszIr3pjnGnlghAN8QkNd7/pMPS
	Is1Cmqs0FlAyIkf38OkFADazH8g1H3kIYu/y0JsCEMgPFzWpfMcAIzOqwL1n0ZD8
	sf3BVnsxwo/FeRze9ePLH2vQDhhOnGe6lufBB8eqHXqsR/VfQHDRnO7DVH3TRhpG
	mIwNx89wbXCg+zEMmcRaJDjfVeB4iRPVFMsRg+zqcs6o1X3SLSTdnp3IcMYtLtt2
	JnZ6l+NY/KMWeWfGSsIxiX12bR0CmWBxICDgfMoT9RVfqV0A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7tvj0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 10:33:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51IAXhSR032686
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 10:33:43 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Feb 2025 02:33:38 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Subject: [PATCH v4 0/2] Use APIs in gdsc genpd to switch gdsc mode for
 venus v4 core
Date: Tue, 18 Feb 2025 16:03:19 +0530
Message-ID: <20250218-switch_gdsc_mode-v4-0-546f6c925ae0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO9htGcC/3XQTU7DMBAF4KtEXmNkj//irrgHqipnPG68SAJxG
 kBV7o5JhRAqLN9I883TXFmhOVNhh+bKZlpzydNYg35oGPZhPBPPsWYGAoyQ0vDylhfsT+dY8DR
 MkXjwKHUK0QdlWV17mSnl9518Pt7yTK+XKi+3IetCIY7TMOTl0FjVqZSEil4GalPrTKLWaYeul
 cGATK7FSNKxL6vPZZnmj73tKnesFtNSAtwXWyUXXFmThHeEXSeeagvMIz7W2zu3wg8BoP4goBL
 UGfQ2EFkL94T6Jv55z6oq4QPoCCk60Pib2LbtE/AgCI+EAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739874819; l=3313;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=jIS928/9+nt0t4eM/RN2f9Shstwdhs7mzb3JIv7bwE0=;
 b=OKHSs+unf2+Prrpivir/jEF7A63HVnaKmUU4BzWBGM3S0TeX4kwz+vKWj5WbqGl46Wv/HMiBI
 Ieeyhq67AdUBqy7KD2xH2O/MQd5uMUWH7+dCYlTB9ud3X61r3Af1g21
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6S_etKtEc8vTyTEmTbrOimyt7Y8QQCV8
X-Proofpoint-ORIG-GUID: 6S_etKtEc8vTyTEmTbrOimyt7Y8QQCV8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_04,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 mlxlogscore=648 clxscore=1015 phishscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502180081

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

Make venus driver to use dev_pm_genpd_set_hwmode() to switch GDSC mode on
v4.
- 1. the venus driver adds compatibility with the new way to switch GDSC
mode.
- 2. the clock driver uses the HW_CTRL_TRIGGER flag, which means the venus
driver needs to use the dev_pm_genpd_set_hwmode() API to switch GDSC mode.

Validated this series on QCS615 and SC7180.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
Changes in v4:
- 1. Update the order of patches.
- 2. Update vcodec_control_v4 to try dev_pm_genpd_set_hwmode first.
- 3. Add hwmode_dev to indicate whether to use HW_CTRL_TRIGGER flag.
- 4. Update commit message and cover letter message.
- 5. Remove the patch that cleaned up dead code and will submit this patch
with next patch series.
- Link to v3: https://lore.kernel.org/r/20250115-switch_gdsc_mode-v3-0-9a24d2fd724c@quicinc.com

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
Renjiang Han (1):
      venus: pm_helpers: add compatibility for dev_pm_genpd_set_hwmode on V4

Taniya Das (1):
      clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for video GDSC's

 drivers/clk/qcom/videocc-sc7180.c              |  2 +-
 drivers/clk/qcom/videocc-sdm845.c              |  4 +--
 drivers/clk/qcom/videocc-sm7150.c              |  4 +--
 drivers/clk/qcom/videocc-sm8150.c              |  4 +--
 drivers/clk/qcom/videocc-sm8450.c              |  4 +--
 drivers/media/platform/qcom/venus/core.h       |  2 ++
 drivers/media/platform/qcom/venus/pm_helpers.c | 38 ++++++++++++++------------
 7 files changed, 32 insertions(+), 26 deletions(-)
---
base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
change-id: 20250115-switch_gdsc_mode-a9c14fad9a36

Best regards,
-- 
Renjiang Han <quic_renjiang@quicinc.com>


