Return-Path: <linux-media+bounces-11744-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1056D8CC476
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 17:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33F121C20C91
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 15:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767391465A8;
	Wed, 22 May 2024 15:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kDiSdJzY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101C0145B3E;
	Wed, 22 May 2024 15:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716392881; cv=none; b=Ru04gmizTMQgGFfY/f4fDOfAXwp4pWBldkwYHUgP8kx5akxxzq7zARhJhbNefcCrqIGkKvjEtR7aMNV9juNIKK9e1XrfUHTl2TYPG9zHeIp5C/9yOCXCD9lnqwKUgZOhKy2iBMsfd6JndGw+mwNDGXijdw4+5yL5kXqvri2qNnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716392881; c=relaxed/simple;
	bh=5EnyNP34V6DX3f8AgLny/ZmCBVsbH3rFMPKhLS3t6rc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GygaouwXQPwYxUL3QrxOVndRYjSkeumgl0RUmiHTZmg68C6vRvHQaOIbyXohlxEJHn+QQQT5rWUb8kvLCMueY5vhyiP1oguBbJeOLYnMoiGhtXDOIzcRD4RBhfJBCzjzcdfyFcR7po3JCmLHrl7E126cL/W4te8+RAqgUfmnFYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kDiSdJzY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44M80e4i030101;
	Wed, 22 May 2024 15:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=K7nBQ3rocbg4BB7pgzfPr2/zh5pmDhdc62MdJ5nZ92Q=; b=kD
	iSdJzYFQm5TuHpyHkZ2gWNMbC0W98XhrdVA8gikgSqKw+DWBsPxJzOQH4CrOaA8D
	FLXfheI8eWVqIKfqiU5BmMRfpRKa9JVwH3RUrwsque90pxnF8/qBtLdDpxM473KI
	lyuP7cgP11SZRORtuXY64x+KrlZml3x7CyHy/U7FGTzsaBhxQa1X/Z+MAtYWpQmx
	lPrTAK4uLS1woNEVg1pPtaFuyekf4FKclDGcw0U4/lgVs6I208xHpQCWhGrYUs5e
	iiQQxQyKNL21hnGbPRMULbkmUL7RRZCDGMR2/r1QdAsvtiAlFVA5YG/cZpoTJtkK
	IyJ7vw8k/eKRKkHk4ztQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n4p9v7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 15:47:53 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44MFlqWx016042
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 15:47:52 GMT
Received: from grosikop.eu.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 May 2024 08:47:49 -0700
From: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <hverkuil-cisco@xs4all.nl>, <quic_hariramp@quicinc.com>
Subject: [PATCH v4 7/8] media: qcom: camss: Decompose register and link operations
Date: Wed, 22 May 2024 18:46:58 +0300
Message-ID: <20240522154659.510-8-quic_grosikop@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522154659.510-1-quic_grosikop@quicinc.com>
References: <20240522154659.510-1-quic_grosikop@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JwjVgy1zWbPUNGnns8d5F6BfXb1j31bS
X-Proofpoint-GUID: JwjVgy1zWbPUNGnns8d5F6BfXb1j31bS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_08,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 spamscore=0
 impostorscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220107

From: Atanas Filipov <quic_afilipov@quicinc.com>

Split link and register operations.
Add dedicated link callback according to SoC identifier.

Signed-off-by: Atanas Filipov <quic_afilipov@quicinc.com>
Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sc8280xp/sm8250/sdm845/apq8016
---
 drivers/media/platform/qcom/camss/camss.c | 141 ++++++++++++----------
 drivers/media/platform/qcom/camss/camss.h |   1 +
 2 files changed, 81 insertions(+), 61 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1b75918fc35b..8a3968d1cd83 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1756,72 +1756,30 @@ static int camss_init_subdevices(struct camss *camss)
 }
 
 /*
- * camss_register_entities - Register subdev nodes and create links
+ * camss_link_entities - Register subdev nodes and create links
  * @camss: CAMSS device
  *
  * Return 0 on success or a negative error code on failure
  */
-static int camss_register_entities(struct camss *camss)
+static int camss_link_entities(struct camss *camss)
 {
 	int i, j, k;
 	int ret;
 
-	for (i = 0; i < camss->res->csiphy_num; i++) {
-		ret = msm_csiphy_register_entity(&camss->csiphy[i],
-						 &camss->v4l2_dev);
-		if (ret < 0) {
-			dev_err(camss->dev,
-				"Failed to register csiphy%d entity: %d\n",
-				i, ret);
-			goto err_reg_csiphy;
-		}
-	}
-
-	for (i = 0; i < camss->res->csid_num; i++) {
-		ret = msm_csid_register_entity(&camss->csid[i],
-					       &camss->v4l2_dev);
-		if (ret < 0) {
-			dev_err(camss->dev,
-				"Failed to register csid%d entity: %d\n",
-				i, ret);
-			goto err_reg_csid;
-		}
-	}
-
-	ret = msm_ispif_register_entities(camss->ispif,
-					  &camss->v4l2_dev);
-	if (ret < 0) {
-		dev_err(camss->dev, "Failed to register ispif entities: %d\n",
-		ret);
-		goto err_reg_ispif;
-	}
-
-	for (i = 0; i < camss->res->vfe_num; i++) {
-		ret = msm_vfe_register_entities(&camss->vfe[i],
-						&camss->v4l2_dev);
-		if (ret < 0) {
-			dev_err(camss->dev,
-				"Failed to register vfe%d entities: %d\n",
-				i, ret);
-			goto err_reg_vfe;
-		}
-	}
-
 	for (i = 0; i < camss->res->csiphy_num; i++) {
 		for (j = 0; j < camss->res->csid_num; j++) {
-			ret = media_create_pad_link(
-				&camss->csiphy[i].subdev.entity,
-				MSM_CSIPHY_PAD_SRC,
-				&camss->csid[j].subdev.entity,
-				MSM_CSID_PAD_SINK,
-				0);
+			ret = media_create_pad_link(&camss->csiphy[i].subdev.entity,
+						    MSM_CSIPHY_PAD_SRC,
+						    &camss->csid[j].subdev.entity,
+						    MSM_CSID_PAD_SINK,
+						    0);
 			if (ret < 0) {
 				dev_err(camss->dev,
 					"Failed to link %s->%s entities: %d\n",
 					camss->csiphy[i].subdev.entity.name,
 					camss->csid[j].subdev.entity.name,
 					ret);
-				goto err_link;
+				return ret;
 			}
 		}
 	}
@@ -1829,19 +1787,18 @@ static int camss_register_entities(struct camss *camss)
 	if (camss->ispif) {
 		for (i = 0; i < camss->res->csid_num; i++) {
 			for (j = 0; j < camss->ispif->line_num; j++) {
-				ret = media_create_pad_link(
-					&camss->csid[i].subdev.entity,
-					MSM_CSID_PAD_SRC,
-					&camss->ispif->line[j].subdev.entity,
-					MSM_ISPIF_PAD_SINK,
-					0);
+				ret = media_create_pad_link(&camss->csid[i].subdev.entity,
+							    MSM_CSID_PAD_SRC,
+							    &camss->ispif->line[j].subdev.entity,
+							    MSM_ISPIF_PAD_SINK,
+							    0);
 				if (ret < 0) {
 					dev_err(camss->dev,
 						"Failed to link %s->%s entities: %d\n",
 						camss->csid[i].subdev.entity.name,
 						camss->ispif->line[j].subdev.entity.name,
 						ret);
-					goto err_link;
+					return ret;
 				}
 			}
 		}
@@ -1863,7 +1820,7 @@ static int camss_register_entities(struct camss *camss)
 							ispif->entity.name,
 							vfe->entity.name,
 							ret);
-						goto err_link;
+						return ret;
 					}
 				}
 	} else {
@@ -1884,15 +1841,67 @@ static int camss_register_entities(struct camss *camss)
 							csid->entity.name,
 							vfe->entity.name,
 							ret);
-						goto err_link;
+						return ret;
 					}
 				}
 	}
 
+	return 0;
+}
+
+/*
+ * camss_register_entities - Register subdev nodes and create links
+ * @camss: CAMSS device
+ *
+ * Return 0 on success or a negative error code on failure
+ */
+static int camss_register_entities(struct camss *camss)
+{
+	int i;
+	int ret;
+
+	for (i = 0; i < camss->res->csiphy_num; i++) {
+		ret = msm_csiphy_register_entity(&camss->csiphy[i],
+						 &camss->v4l2_dev);
+		if (ret < 0) {
+			dev_err(camss->dev,
+				"Failed to register csiphy%d entity: %d\n",
+				i, ret);
+			goto err_reg_csiphy;
+		}
+	}
+
+	for (i = 0; i < camss->res->csid_num; i++) {
+		ret = msm_csid_register_entity(&camss->csid[i],
+					       &camss->v4l2_dev);
+		if (ret < 0) {
+			dev_err(camss->dev,
+				"Failed to register csid%d entity: %d\n",
+				i, ret);
+			goto err_reg_csid;
+		}
+	}
+
+	ret = msm_ispif_register_entities(camss->ispif,
+					  &camss->v4l2_dev);
+	if (ret < 0) {
+		dev_err(camss->dev, "Failed to register ispif entities: %d\n", ret);
+		goto err_reg_ispif;
+	}
+
+	for (i = 0; i < camss->res->vfe_num; i++) {
+		ret = msm_vfe_register_entities(&camss->vfe[i],
+						&camss->v4l2_dev);
+		if (ret < 0) {
+			dev_err(camss->dev,
+				"Failed to register vfe%d entities: %d\n",
+				i, ret);
+			goto err_reg_vfe;
+		}
+	}
+
 	return 0;
 
-err_link:
-	i = camss->res->vfe_num;
 err_reg_vfe:
 	for (i--; i >= 0; i--)
 		msm_vfe_unregister_entities(&camss->vfe[i]);
@@ -2212,6 +2221,10 @@ static int camss_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_v4l2_device_unregister;
 
+	ret = camss->res->link_entities(camss);
+	if (ret < 0)
+		goto err_register_subdevs;
+
 	if (num_subdevs) {
 		camss->notifier.ops = &camss_subdev_notifier_ops;
 
@@ -2291,6 +2304,7 @@ static const struct camss_resources msm8916_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8x16),
 	.csid_num = ARRAY_SIZE(csid_res_8x16),
 	.vfe_num = ARRAY_SIZE(vfe_res_8x16),
+	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources msm8996_resources = {
@@ -2302,6 +2316,7 @@ static const struct camss_resources msm8996_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8x96),
 	.csid_num = ARRAY_SIZE(csid_res_8x96),
 	.vfe_num = ARRAY_SIZE(vfe_res_8x96),
+	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sdm660_resources = {
@@ -2313,6 +2328,7 @@ static const struct camss_resources sdm660_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_660),
 	.csid_num = ARRAY_SIZE(csid_res_660),
 	.vfe_num = ARRAY_SIZE(vfe_res_660),
+	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sdm845_resources = {
@@ -2323,6 +2339,7 @@ static const struct camss_resources sdm845_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_845),
 	.csid_num = ARRAY_SIZE(csid_res_845),
 	.vfe_num = ARRAY_SIZE(vfe_res_845),
+	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sm8250_resources = {
@@ -2336,6 +2353,7 @@ static const struct camss_resources sm8250_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8250),
 	.csid_num = ARRAY_SIZE(csid_res_8250),
 	.vfe_num = ARRAY_SIZE(vfe_res_8250),
+	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sc8280xp_resources = {
@@ -2350,6 +2368,7 @@ static const struct camss_resources sc8280xp_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_sc8280xp),
 	.csid_num = ARRAY_SIZE(csid_res_sc8280xp),
 	.vfe_num = ARRAY_SIZE(vfe_res_sc8280xp),
+	.link_entities = camss_link_entities
 };
 
 static const struct of_device_id camss_dt_match[] = {
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 9e73a55a257b..588a52eb2d43 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -98,6 +98,7 @@ struct camss_resources {
 	const unsigned int csiphy_num;
 	const unsigned int csid_num;
 	const unsigned int vfe_num;
+	int (*link_entities)(struct camss *camss);
 };
 
 struct camss {
-- 
2.17.1


