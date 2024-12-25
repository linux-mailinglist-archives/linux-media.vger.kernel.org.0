Return-Path: <linux-media+bounces-24067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC539FC572
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 14:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDE9B1883EBA
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 13:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147441C9DCB;
	Wed, 25 Dec 2024 13:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SAj6DOoC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052B01B87EC;
	Wed, 25 Dec 2024 13:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735133781; cv=none; b=b57ZsU7Ii9g/wWORl2loIKQxZRQ5r8P8/KUCqLbAuXp/aGpqbPvTyEnWbXHLyW1HTDSyQ4NEDczwHgj0TTTEBT0WMTYNqEksr9j1duhEeUj7UiCfubmLl66Dp3vdvPJNAOMQW4NhBxRTwC/6YnHC6AfRP48Flb0vJRClcZVbYaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735133781; c=relaxed/simple;
	bh=+eeEL3Oh/gEUsLBqMOxIoyQtqslhuwcvULUR/ayOW3M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B9brj5qqj/2nqA+W3u3epIH6rB46wpjFpGu5RoYf1FroTDrivOifadPENlSW4TumS1VfySXh/z0edWp1YiWjx1iCQ+EPZfWRCO9sL4kG+uZeTJq5VAFgsJUxF0qzLrQ3nEriRM3jMvsPv4DngBQe0JJu9G1lTDOB9RfjUk7pz/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SAj6DOoC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP7UdjX009394;
	Wed, 25 Dec 2024 13:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KQnkHB4skPhaAVN9EvxFc3jY1j+ADF/m/gyyIQpTguI=; b=SAj6DOoC6o23kBe9
	QsQqdZW1l7NfiW52yi8MkjDvX7JJUBysF5NpBo3EQdQcfstheC0MrTwBXgo1Wg5R
	mlFGK6u/lFH3YYCeUcJyHBPx9/SA4MJQaZgUe3NJt8UKRxwLIuQxiEnDpTPSscKU
	TclguSpSnVQqF9nNgdHo9fBxu/vQn9Q6LElUrjpDqNx+Z4fVO4L2f7yp73WVp6Up
	6YGrvfk/kvaNIojg4ESvx/3ouVy/nRlbvnT/ZVJDlI5Y/8+SFMduSSxG6CV2sL93
	n/oSIPjuOphj2CMC6mXY/qp4K639ks+0RrhUfm74Whn8yTED0i4FohX4iUZGorfc
	olqNoQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rdqmrwgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 13:36:15 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BPDZxe1032484
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 13:35:59 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Dec 2024 05:35:53 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH 04/16] media: qcom: camss: csiphy: Add an init callback to CSI PHY devices
Date: Wed, 25 Dec 2024 19:05:11 +0530
Message-ID: <20241225133523.4034820-5-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241225133523.4034820-1-quic_depengs@quicinc.com>
References: <20241225133523.4034820-1-quic_depengs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: U5vfQC_f2S9s8Pc2W2izgR--3TkKT624
X-Proofpoint-ORIG-GUID: U5vfQC_f2S9s8Pc2W2izgR--3TkKT624
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412250121

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add a nop init callback to CSIPHY devices, this callback is used to add
some HW register offset and register configuration for specific platform,
then different platform can reuse the same CSIPHY driver. Later changes
will enumerate with enabling code.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
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
index 73e4c05a9dec..b283df7634bb 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -586,6 +586,11 @@ static void csiphy_lanes_disable(struct csiphy_device *csiphy,
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
@@ -593,4 +598,5 @@ const struct csiphy_hw_ops csiphy_ops_3ph_1_0 = {
 	.lanes_enable = csiphy_lanes_enable,
 	.lanes_disable = csiphy_lanes_disable,
 	.isr = csiphy_isr,
+	.init = csiphy_init,
 };
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 3791c2d8a6cf..c053616558a7 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -594,6 +594,10 @@ int msm_csiphy_subdev_init(struct camss *camss,
 	csiphy->cfg.combo_mode = 0;
 	csiphy->res = &res->csiphy;
 
+	ret = csiphy->res->hw_ops->init(csiphy);
+	if (ret)
+		return ret;
+
 	/* Memory */
 
 	csiphy->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 90cc3f976643..49393dfd5215 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -77,6 +77,7 @@ struct csiphy_hw_ops {
 	void (*lanes_disable)(struct csiphy_device *csiphy,
 			      struct csiphy_config *cfg);
 	irqreturn_t (*isr)(int irq, void *dev);
+	int (*init)(struct csiphy_device *csiphy);
 };
 
 struct csiphy_subdev_resources {
-- 
2.34.1


