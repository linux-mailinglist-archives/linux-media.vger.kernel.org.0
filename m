Return-Path: <linux-media+bounces-21967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 093749D8380
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 11:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F5531645F1
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 10:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC03199921;
	Mon, 25 Nov 2024 10:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jwSAl4x9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDF7198A34;
	Mon, 25 Nov 2024 10:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732530930; cv=none; b=A6kX1j2+r0+3tXE9MGv5BzapmVhm8DLoyRMJhVvfWd776ksWtL8NaJtjCNHp24Ml82fK7fTdULtW5rQLg+ZsY1HGANYgT87Kwx0ZqVMv9jS45D8lzQucKfi/LTiXebqHFkFzAQsjEcW3/loJf+z7tbjVmHyTryS4zQpx7UWSM38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732530930; c=relaxed/simple;
	bh=PiaKR/GdQJvgzXXuBnKfgdsDPz3KTLuRbZPN+gTjnv8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HY8HhuvSn+u4DJCOKeWfCQ7YPpOTTFoVAkL+gR/D1Sja4j4LqtTuE7W4fY+LTrVcFQ4iyDwzsU48rN2YF0oLK8CqtL/yFkmS5Don+QfPnxzsSSbDRg3hK/7gjDLe1RV+rTQmvaz1N/MtbNa4119k5D9fjzVMWXlrscwheRPRhRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jwSAl4x9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP0U5FO014032;
	Mon, 25 Nov 2024 10:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DjxiYNoGatXOOZ6LseCwaeSK7qK/xgnFdjNBMpSavmM=; b=jwSAl4x9u8GMKC8u
	ETlOP/+Kfafu/o6Xi1BDl0dj+J0KGAp2OSZg6jzD/i3sVJfVwrmLMiskMthPanMF
	YmZtxzV7T8X8wwDfiEDfJOIlkHMa7NAFiikNfoKXzFogXT5Bg4O14n0C48zbUvgW
	W6aEszPI+XT8LMkcV2nBZ2opEjvAaeVz5mEa/WsCievdSyQgSI0hjTEHSlgM6byV
	l8IvlXgPQsixWSBTNLovgKt5GoidQkEM4l+KpdVntrwGFw24RpB59pOS1cjPtqcC
	SIia8gOJCZ7QMiUV5Mzk75fAZYTSlmhMpNSDIbDhcyKjXc7d1MJwql7uHLjhn5T0
	BFVIKA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4334rd4h8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 10:35:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4APAZO71022106
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 10:35:24 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 25 Nov 2024 02:35:19 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v3 2/2] media: qcom: camss: Restructure camss_link_entities
Date: Mon, 25 Nov 2024 16:04:57 +0530
Message-ID: <20241125103457.1970608-3-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241125103457.1970608-1-quic_vikramsa@quicinc.com>
References: <20241125103457.1970608-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: tl-vUZtu2wr0_EdzYjARugC-crlkYxLh
X-Proofpoint-GUID: tl-vUZtu2wr0_EdzYjARugC-crlkYxLh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411250090

Refactor the camss_link_entities function by breaking it down into
three distinct functions. Each function will handle the linking of
a specific entity separately.
SC7280 and later targets mandates for 1:1 linking for csid -> vfe.
i.e. csid0 can be mapped to vfe0 only.

Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss.c | 155 ++++++++++++++--------
 1 file changed, 103 insertions(+), 52 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 520c5bc7a265..6ebf65019eed 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1994,7 +1994,6 @@ static int camss_init_subdevices(struct camss *camss)
 }
 
 /*
- * camss_link_entities - Register subdev nodes and create links
  * camss_link_err - print error in case link creation fails
  * @src_name: name for source of the link
  * @sink_name: name for sink of the link
@@ -2014,14 +2013,64 @@ inline void camss_link_err(struct camss *camss,
 }
 
 /*
- * camss_link_entities - Register subdev nodes and create links
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
@@ -2041,66 +2090,68 @@ static int camss_link_entities(struct camss *camss)
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
-					camss_link_err(camss, src_entity->name,
-						       camss->csid[i].subdev.entity.name,
-						       camss->ispif->line[j].subdev.entity.name,
+					camss_link_err(camss, ispif->entity.name,
+						       vfe->entity.name,
 						       ret);
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
-						camss_link_err(camss, ispif->entity.name,
-							       vfe->entity.name,
-							       ret);
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
-						camss_link_err(camss, csid->entity.name,
-							       vfe->entity.name,
-							       ret);
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
-- 
2.25.1


