Return-Path: <linux-media+bounces-21824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8419D5D56
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 11:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AFEA1F2325C
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4871DE89E;
	Fri, 22 Nov 2024 10:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cXe2MDW/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2A41D90BC;
	Fri, 22 Nov 2024 10:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732271530; cv=none; b=Y73Q2F0hUJiB0p/zPub09JdVjvJLlV7wjwAbTWESJ3dVwUpjb2jaRNuGJhxqQyrWZH6ay683vYmL2PMSPHsqEuI/GeHM2UOBCM2BiNxqXpgCHWyTAoMRepd3nNga4c1/2Ck9XZQU5++Mm/B9JCOYacNcb87VOo2tEyh7IHmI5KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732271530; c=relaxed/simple;
	bh=kpX3NfYPi71EcttP9EU4etHWc+PQ9ltLoBhj6Ac9QsA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=r45tW3qu7wPckLUDiCVakiQjQN6sk8d3/sihdEcNzIE9M1ixVtrCZB0PB/wMXChNki9NeKx/mi8grF/cAsvCF0hvkg5ZB5XoZoAWCbeBzCM/u212npnUY3l0Y7LsS/xm2WnINm7DmRR5U/x/HrBTZQD2iS6MKABJfqlJTb8blVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cXe2MDW/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM4UkxD020262;
	Fri, 22 Nov 2024 10:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M7U7nnuL8F0cHhtZcGN1dv
	3Lva34Ify9MuzathaN0qw=; b=cXe2MDW/bQWuKCSYv/x5BSjFpAdwdliLYWLSfg
	b/piipcF0K5IhVpW5yWj4S3OMMeHCW1JiCHd0KlaAgGMjuRCUN9asm4wmg9yI8E9
	V2LzUrf2FSUlk9VrXalS25zrBwucMuVc3Fyw4lLi/C+1KyoYUJvkgyeiMhDDcCcA
	VCOpLfhvv/TgZQjYZd75jSDaE7XGk/3lVLT98PlrSvFVmznahVFicyg8fNe+UL+1
	x0is6LCILHF5uXO9RmJ29AsK6QaTZbKvjgzUObLhEC3/fDsjIEE1Jpu1kHvupwby
	PBj5RiGoFyLQFpFA/0zRhag/LLEkw0+7ivhOE3uYYCcfPdUg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4326atasca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 10:32:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AMAW3hd013985
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 10:32:03 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 22 Nov 2024 02:31:59 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Subject: [PATCH 0/2] Use APIs in gdsc genpd to switch gdsc mode for venus
 v4 core
Date: Fri, 22 Nov 2024 16:01:44 +0530
Message-ID: <20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJBdQGcC/yXMyw6DIBCF4Vcxsy6JAyrUV2mMQRh0FmoFe0mM7
 15Sl99Jzn9AosiUoC0OiPTmxOuSgbcC3GSXkQT7bJClrBClFOnDu5v60SfXz6snMTS1ISuVctJ
 Cvj0jBf7+k4/ucqTtlcv7NcJgEwm3zjPvbdGoQYVQKn9HSyYYXQcyutJOG7S1xKCN84QauvP8A
 cc3IlmuAAAA
X-Change-ID: 20241122-switch_gdsc_mode-b658ea233c2a
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732271519; l=1429;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=kpX3NfYPi71EcttP9EU4etHWc+PQ9ltLoBhj6Ac9QsA=;
 b=jvNeYurSYQcsIou/CC7cftagtWWQUEeXZ72iLUrJgxB5w4VAG/NaKLjV2SUJvU8C43hm5r2rY
 b1S3WajdPxHBRkcks+4fdLLT7M/1ysfJGEtvSZB8cf7L8QlScwcqDhC
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0NX9JnKRQIqPAvilWA0u1CSg-ai7Kmbo
X-Proofpoint-GUID: 0NX9JnKRQIqPAvilWA0u1CSg-ai7Kmbo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1011 mlxlogscore=759 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220089

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

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
Renjiang Han (1):
      venus: pm_helpers: Use dev_pm_genpd_set_hwmode to switch GDSC mode on V4

Taniya Das (1):
      clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for video GDSC's

 drivers/clk/qcom/videocc-sc7180.c              |  2 +-
 drivers/clk/qcom/videocc-sdm845.c              |  4 ++--
 drivers/media/platform/qcom/venus/pm_helpers.c | 10 +++++-----
 3 files changed, 8 insertions(+), 8 deletions(-)
---
base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
change-id: 20241122-switch_gdsc_mode-b658ea233c2a

Best regards,
-- 
Renjiang Han <quic_renjiang@quicinc.com>


