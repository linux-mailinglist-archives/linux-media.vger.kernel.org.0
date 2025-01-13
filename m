Return-Path: <linux-media+bounces-24656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F222A0AE45
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 05:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E6E518867B1
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 04:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33AE918D63A;
	Mon, 13 Jan 2025 04:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hv6U5xVt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33D61BD032;
	Mon, 13 Jan 2025 04:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736742756; cv=none; b=bp/bElVywzHYbquSKcf5kH9ReGVFvwAIcK0mZ5du0kgaf9Zoz/+Z3bOm8XUpaLQkxJINA/5zYOGAPGFbhmYFtJ6jc7mjWr1f2E4PrHYwJjPatSBeoVMlxr3l81voMiu/NS+uZpjIPFDrEGEGqlBqqcPvy6zwGC92W7ZuEVi8I0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736742756; c=relaxed/simple;
	bh=+eeEL3Oh/gEUsLBqMOxIoyQtqslhuwcvULUR/ayOW3M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i4/lhhwxTdW3YHDXbKkpkw3J1S6RV0ElGhKQ1WaegwOwe5VnxyzI7mvzbSf4U08SKyp5yNbsUSBvKEEtuSuvBUm22DYIOOR317YWqIz/gBDQR9b0Z5yTattEEkSMwqSlF0YPAEszIKVM1w3tSdX1jiHYGQMzRKTICZyYumddamY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hv6U5xVt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D2rmpC028107;
	Mon, 13 Jan 2025 04:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KQnkHB4skPhaAVN9EvxFc3jY1j+ADF/m/gyyIQpTguI=; b=hv6U5xVtCXLnfWJ3
	LC4IhfsYmE+hZuUvY14TBgJhwwjBtdpEr+3SNcuqEocabVukjgw1dPkbTLBgBZ4g
	GJvCuIaCJb8D492lyBORtAzOqkZm3ejJvfN9Yncim3Xb/PBWgFNme0RfuHrA3sd6
	B3DyhcqvJm1cQJBeg5a64XRU+Zb/KVLb9f5p+fqtFBuHXhPYUTu3OxNGD45JUgMM
	flyda/MI5uqDMA0bFJzGPV9Y1L1kIwE2ZiUKbIdYsCuLQP2KvjCD6HR49Pb95vbC
	YfKdVadius18a8kcMV+HiTVS1Z3lKRi3IOmU9vUmAWaJz2hI+zcYkdSyhjC33o/u
	3CPVoQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444tevr5y0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 04:32:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D4WTx7024388
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 04:32:29 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 12 Jan 2025 20:32:22 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>,
        <hverkuil@xs4all.nl>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v9 04/16] media: qcom: camss: csiphy: Add an init callback to CSI PHY devices
Date: Mon, 13 Jan 2025 10:01:21 +0530
Message-ID: <20250113043133.1387162-5-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113043133.1387162-1-quic_depengs@quicinc.com>
References: <20250113043133.1387162-1-quic_depengs@quicinc.com>
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
X-Proofpoint-ORIG-GUID: DfwA5QpTQw6gxAHP0PaeeXHH7rxtZRyv
X-Proofpoint-GUID: DfwA5QpTQw6gxAHP0PaeeXHH7rxtZRyv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxscore=0 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130036

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


