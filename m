Return-Path: <linux-media+bounces-23995-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1B59FABC0
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2024 10:03:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A8AF163E22
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2024 09:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06CA191F6A;
	Mon, 23 Dec 2024 09:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pmO24pTe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB4718950A;
	Mon, 23 Dec 2024 09:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734944598; cv=none; b=WBozqdrIsiUxL3Z8S15Vv8vQD/lT2cGNbTo2bw2hMyQB+1f6RcQwxfXUAx0DRkUWGNt/Af0bdvVXwRNI1xKTS9Hopfi6OMMFQfSl1SAvsr+SiUtViZTJx8Qck6e42qIlWDxOOlXQqn9vq6rNavF3NDjIC7EgOENURgQSadqz5wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734944598; c=relaxed/simple;
	bh=JnqaOjxpDlEfIDe+q060j3nTcVDgy4R8TN3nDR4peeg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=I1YF60CJKDLSTAer1caKGCj26n9x+hNba1nSkfNpkmkZ5DbwqJyCzT7Acf3TGYZbh7QiORh1l8cmE36697JzyjzHraiXbx+6tmdd+AoLBYiCG4ms3XUtUwXMlbxK4JYq3kTAmvlDgZqucLFYaIX6YVKwKIcAgr5KdFUAc/IrBX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pmO24pTe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN6BZQg020816;
	Mon, 23 Dec 2024 09:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u+nrQlTDL9aBrOvNoXicLD
	wRyH/0FncItu4hPBtE1AI=; b=pmO24pTeNc4rpoasEw4uUFYHoGv+fzEtjg16GL
	DXwwiTp0P+zxnBz1YPUSHgUtO8Mht7qCjSMfLS4JG32nX+lqR2zsUcsbaeeP1Q51
	jjbhOHalfkDI3Hv0pyZ1P/lyaLygioXuBSgjXVigJelwS4PKYfnq2eCkhCsrLCFg
	EAUn1JsX/y6CK787QtxDnBtyOcvpMYjwAWRPWvYkkwBlUsQFP+mwdc+DyYVi2XNb
	OAO9CLVX65uyPX6eRh/DJFTBA195NLbTP9tfunhlQs2mhvYk0zPEhVIAjebcPltU
	HcwrHHIOxK1qD64JEf0bybDge4kE3QdSM+jXcNMo8WnZEiPw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q2cm0ne1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 09:03:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BN93ALc010282
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 09:03:10 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Dec 2024 01:03:06 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Subject: [PATCH v2 0/2] Use APIs in gdsc genpd to switch gdsc mode for
 venus v4 core
Date: Mon, 23 Dec 2024 14:32:40 +0530
Message-ID: <20241223-switch_gdsc_mode-v2-0-eb5c96aee662@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADAnaWcC/2WOwW6DMAxAfwX5vEyOIYX01P+YqgocU3wA2oSxV
 RX/3owed7KeJT+/JySJKgmOxROirJp0njLQRwE8tNNVjIbMQEiVJSpN+tGFh8s1JL6McxCDB1c
 GaRlr20I+u0Xp9XdXfp3fHOX+nc3Lewldm8TwPI66HItSKgrsiTw771CaqrMSanS9r/J0Eggbo
 gb+XIOmZY6PvXa1u2wPy2X/w1Zr0JQH16OvhbsOT7mCdeLP/BvO27a9AGEfqwn+AAAA
X-Change-ID: 20241223-switch_gdsc_mode-0653deac071a
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
        Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734944586; l=2239;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=JnqaOjxpDlEfIDe+q060j3nTcVDgy4R8TN3nDR4peeg=;
 b=4ZrWVZTil88QA7QzB14BlgCv+RQAAILAMvxcoYvtCk4JqIEE5NyRWOpe2UM5ybrqBoNKXbuRn
 sB7dZuS1TO7Dbq1PkVvCiPp73go+Yj8NahS1jbEd+Hn1K8LZPP6XxIb
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Xj-0ewAr33OAhkziW85-aiH1aiv1orLa
X-Proofpoint-ORIG-GUID: Xj-0ewAr33OAhkziW85-aiH1aiv1orLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 mlxlogscore=652 impostorscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230081

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

Validated this patch series on QCS615 and SC7180.
Also, need help to verify on sdm845 as we have no sdm845 device in hand.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
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
      venus: pm_helpers: Use dev_pm_genpd_set_hwmode to switch GDSC mode on V4

Taniya Das (1):
      clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for video GDSC's

 drivers/clk/qcom/videocc-sc7180.c              |  2 +-
 drivers/clk/qcom/videocc-sdm845.c              |  4 ++--
 drivers/clk/qcom/videocc-sm7150.c              |  4 ++--
 drivers/clk/qcom/videocc-sm8150.c              |  4 ++--
 drivers/clk/qcom/videocc-sm8450.c              |  4 ++--
 drivers/media/platform/qcom/venus/pm_helpers.c | 10 +++++-----
 6 files changed, 14 insertions(+), 14 deletions(-)
---
base-commit: 3e42dc9229c5950e84b1ed705f94ed75ed208228
change-id: 20241223-switch_gdsc_mode-0653deac071a

Best regards,
-- 
Renjiang Han <quic_renjiang@quicinc.com>


