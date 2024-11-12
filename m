Return-Path: <linux-media+bounces-21319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 007769C5BDF
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 16:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8065B2CDCA
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 13:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC0A1607B2;
	Tue, 12 Nov 2024 13:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TZJzghY8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4084156C6F;
	Tue, 12 Nov 2024 13:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731418758; cv=none; b=DuAmoADTM5V1krFQAcmZSmLPqAmug9zFhGyXDLAM+wQR9RSCsFbkBgEeLfvpOIJa44O2h0gAKdRyMvfJz2oLOX8rIgrlF0twLdHIU/44GeOJ8vOdqAgJVcFAYIsWZ+ZeVDzOowXa6KVRJkQjwFnnNb+o0MdD3T62zY74r6AA7N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731418758; c=relaxed/simple;
	bh=DH5BtULdqSGhyU8QrENODLjP9GNOBGoxYdLX2tcrvuY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pJpXmKRTUKiY/o26RgfOr9Oj0q8/XdtYqCEh3lP/Er4XRMZrC4Yf81YJyPx7MDy20Z7w96e6ASa2+By6+ZN/6SzARDxEBtfj1pPy6XCzNG2Pd0VhaseQVeOcakoPTzyJeZogbZBw6YgsG8FMlQToP8BWa2Dr2FNKr/I+JJmxnAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TZJzghY8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACDVNL5030151;
	Tue, 12 Nov 2024 13:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vwVnNo1HF0Z4aXuQmffdkmLkvpVN2jTRJNM1hdMmzk4=; b=TZJzghY8Rw6xcH2z
	UM7lfogPZaaQjvqMcAEGI8cBWtZeWv79RZjvLY/J8+AFmwrh3oVixK2fla66b2G+
	CgVEPDMM8lBD0mfLd278Z3TM2Lb/+wOZs/OdO5b5XVGcf8PKpLatv5eiHETquEtg
	jT4n+I8D5+ogITTK8iV5rRUWiW5cwAyiAUsev0H1M68+r2YxBM+5Ipd/DgpNd36l
	Jgc2cZfnwldM9XyDGQuiPLYJH5F114ChgM5NX9GYn4gj/sa1uUp6Ni9d76NNX0dv
	IPfCOMsUh673/BGF6xkTjZ3PgfhjyvXmO1la/8xD29/8L390p2Pk8bNGWDsNBnNU
	WbNS8Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0gkyarb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 13:39:12 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACDdBHe022959
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 13:39:12 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 05:39:05 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>
CC: <quic_vikramsa@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v2 1/1] media: qcom: camss: Restructure camss_link_entities
Date: Tue, 12 Nov 2024 19:08:46 +0530
Message-ID: <20241112133846.2397017-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241112133846.2397017-1-quic_vikramsa@quicinc.com>
References: <20241112133846.2397017-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: ChuYxnAFWV8sx_sMQK9n8oVEpcRK_LAZ
X-Proofpoint-GUID: ChuYxnAFWV8sx_sMQK9n8oVEpcRK_LAZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=802 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411120109

Refactor the camss_link_entities function by breaking it down into
three distinct functions. Each function will handle the linking of
a specific entity separately, enhancing readability.

Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c |   6 +-
 drivers/media/platform/qcom/camss/camss.c     | 196 ++++++++++++------
 drivers/media/platform/qcom/camss/camss.h     |   4 +
 3 files changed, 138 insertions(+), 68 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 83c5a36d071f..446604cc7ef6 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1794,9 +1794,9 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 				&video_out->vdev.entity, 0,
 				MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
 		if (ret < 0) {
-			dev_err(dev, "Failed to link %s->%s entities: %d\n",
-				sd->entity.name, video_out->vdev.entity.name,
-				ret);
+			camss_link_err(vfe->camss, sd->entity.name,
+				       video_out->vdev.entity.name,
+				       ret);
 			goto error_link;
 		}
 	}
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index fabe034081ed..980cb1e337be 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1840,14 +1840,83 @@ static int camss_init_subdevices(struct camss *camss)
 }
 
 /*
- * camss_link_entities - Register subdev nodes and create links
+ * camss_link_err - print error in case link creation fails
+ * @src_name: name for source of the link
+ * @sink_name: name for sink of the link
+ */
+inline void camss_link_err(struct camss *camss,
+			   const char *src_name,
+			   const char *sink_name,
+			   int ret)
+{
+	if (!camss || !src_name || !sink_name)
+		return;
+	dev_err(camss->dev,
+		"Failed to link %s->%s entities: %d\n",
+		src_name,
+		sink_name,
+		ret);
+}
+
+/*
+ * camss_link_entities_csid - Register subdev nodes and create links
  * @camss: CAMSS device
  *
  * Return 0 on success or a negative error code on failure
  */
-static int camss_link_entities(struct camss *camss)
+static int camss_link_entities_csid(struct camss *camss)
 {
-	int i, j, k;
+	struct media_entity *src_entity;
+	struct media_entity *sink_entity;
+	int ret, line_num;
+	u16 sink_pad;
+	u16 src_pad;
+	int i, j;
+
+	for (i = 0; i < camss->res->csid_num; i++) {
+		if (camss->ispif)
+			line_num = camss->ispif->line_num;
+		else
+			line_num = camss->vfe[i].res->line_num;
+
+		src_entity = &camss->csid[i].subdev.entity;
+		for (j = 0; j < line_num; j++) {
+			if (camss->ispif) {
+				sink_entity = &camss->ispif->line[j].subdev.entity;
+				src_pad = MSM_CSID_PAD_SRC;
+				sink_pad = MSM_ISPIF_PAD_SINK;
+			} else {
+				sink_entity = &camss->vfe[i].line[j].subdev.entity;
+				src_pad = MSM_CSID_PAD_FIRST_SRC + j;
+				sink_pad = MSM_VFE_PAD_SINK;
+			}
+
+			ret = media_create_pad_link(src_entity,
+						    src_pad,
+						    sink_entity,
+						    sink_pad,
+						    0);
+			if (ret < 0) {
+				camss_link_err(camss, src_entity->name,
+					       sink_entity->name,
+					       ret);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * camss_link_entities_csiphy - Register subdev nodes and create links
+ * @camss: CAMSS device
+ *
+ * Return 0 on success or a negative error code on failure
+ */
+static int camss_link_entities_csiphy(struct camss *camss)
+{
+	int i, j;
 	int ret;
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
@@ -1858,81 +1927,77 @@ static int camss_link_entities(struct camss *camss)
 						    MSM_CSID_PAD_SINK,
 						    0);
 			if (ret < 0) {
-				dev_err(camss->dev,
-					"Failed to link %s->%s entities: %d\n",
-					camss->csiphy[i].subdev.entity.name,
-					camss->csid[j].subdev.entity.name,
-					ret);
+				camss_link_err(camss,
+					       camss->csiphy[i].subdev.entity.name,
+					       camss->csid[j].subdev.entity.name,
+					       ret);
 				return ret;
 			}
 		}
 	}
 
-	if (camss->ispif) {
-		for (i = 0; i < camss->res->csid_num; i++) {
-			for (j = 0; j < camss->ispif->line_num; j++) {
-				ret = media_create_pad_link(&camss->csid[i].subdev.entity,
-							    MSM_CSID_PAD_SRC,
-							    &camss->ispif->line[j].subdev.entity,
-							    MSM_ISPIF_PAD_SINK,
+	return 0;
+}
+
+/*
+ * camss_link_entities_ispif - Register subdev nodes and create links
+ * @camss: CAMSS device
+ *
+ * Return 0 on success or a negative error code on failure
+ */
+static int camss_link_entities_ispif(struct camss *camss)
+{
+	int i, j, k;
+	int ret;
+
+	for (i = 0; i < camss->ispif->line_num; i++) {
+		for (k = 0; k < camss->res->vfe_num; k++) {
+			for (j = 0; j < camss->vfe[k].res->line_num; j++) {
+				struct v4l2_subdev *ispif = &camss->ispif->line[i].subdev;
+				struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
+
+				ret = media_create_pad_link(&ispif->entity,
+							    MSM_ISPIF_PAD_SRC,
+							    &vfe->entity,
+							    MSM_VFE_PAD_SINK,
 							    0);
 				if (ret < 0) {
-					dev_err(camss->dev,
-						"Failed to link %s->%s entities: %d\n",
-						camss->csid[i].subdev.entity.name,
-						camss->ispif->line[j].subdev.entity.name,
-						ret);
+					camss_link_err(camss, ispif->entity.name,
+						       vfe->entity.name,
+						       ret);
 					return ret;
 				}
 			}
 		}
-
-		for (i = 0; i < camss->ispif->line_num; i++)
-			for (k = 0; k < camss->res->vfe_num; k++)
-				for (j = 0; j < camss->vfe[k].res->line_num; j++) {
-					struct v4l2_subdev *ispif = &camss->ispif->line[i].subdev;
-					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
-
-					ret = media_create_pad_link(&ispif->entity,
-								    MSM_ISPIF_PAD_SRC,
-								    &vfe->entity,
-								    MSM_VFE_PAD_SINK,
-								    0);
-					if (ret < 0) {
-						dev_err(camss->dev,
-							"Failed to link %s->%s entities: %d\n",
-							ispif->entity.name,
-							vfe->entity.name,
-							ret);
-						return ret;
-					}
-				}
-	} else {
-		for (i = 0; i < camss->res->csid_num; i++)
-			for (k = 0; k < camss->res->vfe_num; k++)
-				for (j = 0; j < camss->vfe[k].res->line_num; j++) {
-					struct v4l2_subdev *csid = &camss->csid[i].subdev;
-					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
-
-					ret = media_create_pad_link(&csid->entity,
-								    MSM_CSID_PAD_FIRST_SRC + j,
-								    &vfe->entity,
-								    MSM_VFE_PAD_SINK,
-								    0);
-					if (ret < 0) {
-						dev_err(camss->dev,
-							"Failed to link %s->%s entities: %d\n",
-							csid->entity.name,
-							vfe->entity.name,
-							ret);
-						return ret;
-					}
-				}
 	}
 
 	return 0;
 }
 
+/*
+ * camss_link_entities - Register subdev nodes and create links
+ * @camss: CAMSS device
+ *
+ * Return 0 on success or a negative error code on failure
+ */
+static int camss_link_entities(struct camss *camss)
+{
+	int ret;
+
+	ret = camss_link_entities_csiphy(camss);
+	if (ret < 0)
+		return ret;
+
+	ret = camss_link_entities_csid(camss);
+	if (ret < 0)
+		return ret;
+
+	if (camss->ispif)
+		ret = camss_link_entities_ispif(camss);
+
+	return ret;
+}
+
 /*
  * camss_register_entities - Register subdev nodes and create links
  * @camss: CAMSS device
@@ -2073,9 +2138,10 @@ static int camss_subdev_notifier_complete(struct v4l2_async_notifier *async)
 				input, MSM_CSIPHY_PAD_SINK,
 				MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
 			if (ret < 0) {
-				dev_err(camss->dev,
-					"Failed to link %s->%s entities: %d\n",
-					sensor->name, input->name, ret);
+				camss_link_err(camss,
+					       sensor->name,
+					       input->name,
+					       ret);
 				return ret;
 			}
 		}
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 0ce84fcbbd25..2086000ad5c1 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -160,5 +160,9 @@ void camss_pm_domain_off(struct camss *camss, int id);
 int camss_vfe_get(struct camss *camss, int id);
 void camss_vfe_put(struct camss *camss, int id);
 void camss_delete(struct camss *camss);
+void camss_link_err(struct camss *camss,
+		    const char *src_name,
+		    const char *sink_name,
+		    int ret);
 
 #endif /* QC_MSM_CAMSS_H */
-- 
2.25.1


