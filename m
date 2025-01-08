Return-Path: <linux-media+bounces-24431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E133A05EE8
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 15:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E18F165B6A
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 14:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EAE1FCFFB;
	Wed,  8 Jan 2025 14:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TtEVg6+v"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9521FCFE7;
	Wed,  8 Jan 2025 14:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736347135; cv=none; b=MJ3Nw0IKbFCpScArVqX8EA22p+Sokppab8fxZBpwRGBrrWmoWrejIuGO0fxXrvwoBdcWXf0852aXja7LU7BMrHWhtk5WQ0XsyEOqk+0JULaMdP3YVcSe/EoLuoPzZs7HzpWfjo3IhDS/W/HU9H7DmXJGKlf5OUYanMq+mfHaivo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736347135; c=relaxed/simple;
	bh=+eeEL3Oh/gEUsLBqMOxIoyQtqslhuwcvULUR/ayOW3M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=krugLNxpfZ/qaOb9sFKsgRPVF9+itJg15uEUMJ6vmtewAFPAlMym+fjCGNrquT4VBdCY6V40HUr1SpgSgcKXCLdEKp5BM1oS7jxlisWG0uoep+Z7uRbIhbeB+pJwg5LiI2aHQ4wrWgUO60/Bm1K/1OJdk1pW88TK8OJmhOUf5/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TtEVg6+v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508BkVnL007514;
	Wed, 8 Jan 2025 14:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KQnkHB4skPhaAVN9EvxFc3jY1j+ADF/m/gyyIQpTguI=; b=TtEVg6+v/wrY6CS0
	dTnJ7U78jVSIhmg29TytcRqBzLLtN40qfFrACZowqMLoxcjnllo+gDVgplAysx6t
	xbSVM7gZF6sBBkEntYZN8bfSPW1BmskvY5WOxC8vcxde+PicLjp0InFBBHnjJ87q
	nEMVDiVQy9rbZeidAebCD8NGE24xxCPAOR7xyjjes1tbLQ5GZbn85igzoMiAiLKJ
	r76MSAkbq4thSQlT9jXb4jfBu2helUppj84hbxx8PnR0cplAY4xMb/ltIWFnbNKw
	AUF3I0zP3r070wg62pAt3Umq5wxpx+ehZD6EPkorIrEkTdb7ReQgrZ5VZIRUDcjd
	03X1Gg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441pgnrsn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 14:38:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508Ecmsd003544
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 14:38:48 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 06:38:42 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>,
        <hverkuil@xs4all.nl>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v8 04/16] media: qcom: camss: csiphy: Add an init callback to CSI PHY devices
Date: Wed, 8 Jan 2025 20:07:21 +0530
Message-ID: <20250108143733.2761200-5-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108143733.2761200-1-quic_depengs@quicinc.com>
References: <20250108143733.2761200-1-quic_depengs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DRD9mDupJ5XWEgozOhyiPPDPpDTZnUcc
X-Proofpoint-ORIG-GUID: DRD9mDupJ5XWEgozOhyiPPDPpDTZnUcc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501080121

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


