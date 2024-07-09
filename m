Return-Path: <linux-media+bounces-14782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1F492BF46
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 18:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DC132869F2
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 16:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E3E1A2FA3;
	Tue,  9 Jul 2024 16:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Le0/aSUi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7AB1A2C1D;
	Tue,  9 Jul 2024 16:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720541259; cv=none; b=MjDbz7ite1/aVfUe56UAEk1lODPGnWwPoAgvckAzvA0yDDSBGwYtBdBU7NIzf/9yAb6r3kYr3V4DFj1AcD0Y8Qspi2VBfiudOzXWKErofy2/bmsOwOj9yXdQa8nUDbznV6ikFHK4UIDHVVgqfRRWL2Bi8ZzhaOCbwqwr8W8yBNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720541259; c=relaxed/simple;
	bh=Ji3By/aaamdUCmBKhrsawpQ5xt4f5zEaP/LbJR5Xa4g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IcXg5eKQ579FZrvsalu9E8ttATScovTJ2k6VMRu7oyegoGKyq6xcZ6K/W8g7lCHKqL9AsYbpH8ZVga+i1/R0Pk4+B916eDDKMPoHgzm07bOFkq2nCM4yc0M7Znhy9WoyrRSaK0W1H5KfsiRFPs3ajdG3hIbLx1qhs0jVla6MonE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Le0/aSUi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469D81rK012640;
	Tue, 9 Jul 2024 16:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=reTo7YUOp3oxq7Nq799zPms/
	OPCdV/BLShEpbgbQbPw=; b=Le0/aSUiqR9CPOGWYBHSL/pRtduksAtiA9vvnMYZ
	DacNpFNVX4QYevMtGzFCf8YG9mxEL9qJG6b4tLiQSUeGTmWSmOUrdvvY9tQ5AR10
	1Pjdkc8099IuGsJVz/B7RlCeR4ayx++Xs7w5/4qUTtT2vOoLmkyDJDErvzHztncz
	lR1Q6M+HAM/7mNnA5OIMygiKZ7cldzLuErEBkotr05SFCife3T4TV8BNtUez50wU
	lARU3VGuQRME1pnDyzSPfC91xvJPrKVC1ayv2EyBKrwHten+JNFahVDoobsDREmI
	y5ozGiLnCiHs5gRPakEAualUC/zHDQbuXp+IszWA3UqEHg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406y3hep2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 16:07:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469G7WGO010227
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 16:07:32 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 09:07:26 -0700
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH 04/13] media: qcom: camss: csiphy: Add an init callback to CSI PHY devices
Date: Tue, 9 Jul 2024 21:36:47 +0530
Message-ID: <20240709160656.31146-5-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240709160656.31146-1-quic_depengs@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YyJ-U-R_o1JqZh0EpBZ3_tdK7xOxhMDp
X-Proofpoint-GUID: YyJ-U-R_o1JqZh0EpBZ3_tdK7xOxhMDp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_05,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090106

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add a nop callback to CSIPHY devices. Later patches will enumerate with
enabling code.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c | 6 ++++++
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 6 ++++++
 drivers/media/platform/qcom/camss/camss-csiphy.c         | 4 ++++
 drivers/media/platform/qcom/camss/camss-csiphy.h         | 1 +
 4 files changed, 17 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
index cd4a8c369234..9d67e7fa6366 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
@@ -180,6 +180,11 @@ static irqreturn_t csiphy_isr(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static int csiphy_init(struct csiphy_device *csiphy)
+{
+	return 0;
+}
+
 const struct csiphy_hw_ops csiphy_ops_2ph_1_0 = {
 	.get_lane_mask = csiphy_get_lane_mask,
 	.hw_version_read = csiphy_hw_version_read,
@@ -187,4 +192,5 @@ const struct csiphy_hw_ops csiphy_ops_2ph_1_0 = {
 	.lanes_enable = csiphy_lanes_enable,
 	.lanes_disable = csiphy_lanes_disable,
 	.isr = csiphy_isr,
+	.init = csiphy_init,
 };
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index bc4834ee2dcc..b60c32a195df 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -581,6 +581,11 @@ static void csiphy_lanes_disable(struct csiphy_device *csiphy,
 			  CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(6));
 }
 
+static int csiphy_init(struct csiphy_device *csiphy)
+{
+	return 0;
+}
+
 const struct csiphy_hw_ops csiphy_ops_3ph_1_0 = {
 	.get_lane_mask = csiphy_get_lane_mask,
 	.hw_version_read = csiphy_hw_version_read,
@@ -588,4 +593,5 @@ const struct csiphy_hw_ops csiphy_ops_3ph_1_0 = {
 	.lanes_enable = csiphy_lanes_enable,
 	.lanes_disable = csiphy_lanes_disable,
 	.isr = csiphy_isr,
+	.init = csiphy_init,
 };
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 2f7361dfd461..ea5c7078ec8e 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -576,6 +576,10 @@ int msm_csiphy_subdev_init(struct camss *camss,
 	csiphy->cfg.combo_mode = 0;
 	csiphy->res = &res->csiphy;
 
+	ret = csiphy->res->hw_ops->init(csiphy);
+	if (ret)
+		return ret;
+
 	/* Memory */
 
 	csiphy->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 47f0b6b09eba..bdf9a9c8bacc 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -71,6 +71,7 @@ struct csiphy_hw_ops {
 	void (*lanes_disable)(struct csiphy_device *csiphy,
 			      struct csiphy_config *cfg);
 	irqreturn_t (*isr)(int irq, void *dev);
+	int (*init)(struct csiphy_device *csiphy);
 };
 
 struct csiphy_subdev_resources {
-- 
2.34.1


