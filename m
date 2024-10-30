Return-Path: <linux-media+bounces-20579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 131F99B60A7
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 11:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6600284159
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 10:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF25F1E764A;
	Wed, 30 Oct 2024 10:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WxCgFdtX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B451E3DC2;
	Wed, 30 Oct 2024 10:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730285712; cv=none; b=AtA/xClSzqiFAyv2kZBpZ1P6NmryWo1BhA5a5FEyMqavNG39Rmq65R9qp/zn52TdCosHD2j0vm5UlEaRADHbQZn/m3brMKtBVLBOs1ySBWogjJ5mH30faWo4aZaayh1+oT+nxh3FPhhvrJbVOKB+Z80VVluMq8cFLUhu/9g16rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730285712; c=relaxed/simple;
	bh=4970G2JLY/yzGIbEwrD7SWDYKmUoDtwqKKkJex9Azqc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nPK3Th/1E3wVwEM1dKBhRDHLkkdT/IkihAQjqMusksGlMTgvYvxfj1ThF4MmJ6vdu4kYcdZ+p0iag0Bdvfsr0RYdlZg5UalMBtJb/pZM/iFfRLXqwOQy+q5olyEGtIEHVv8OKx8RKkmP/rzmxXjvjsWlwVYedkh+UqtkGScYJQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WxCgFdtX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U8tGkq007057;
	Wed, 30 Oct 2024 10:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AHsXIlovFdhS9IXQtuxtH5HCunRGdtFKg5ndk+ClhbU=; b=WxCgFdtXY9iXWDwa
	v/RqGYeUSN1OzOoSEDAtb/uMSTwH7x3Oo+b1NCvEhEeMZPqukRlSYmjLSVjHDBSt
	TCkTKC8JSO386KjpvH2uEIl501zh6a5PK9nv3jEOP0GxdYM63PqnW5QoVIWVkoFZ
	Ut3xpoUIuA9MqQAmivhPqw9a0Loq18eatFo9SIZ7rQzD51IQmsWB03px0+1uJ+ig
	Odp+7M37mmVufnbIJouEmtKy4e/Y4YgRTmu7whLp4ZC2FSzRWJlX7O8nrLIq7v2j
	fd/12jIWm/WvU7ZrZzRpodMJ8K/Y1UiEKM5cBif1IxsgvrhmrfFBJHfmTCiKmTQp
	Y6PWQw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42khqbrbew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 10:54:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UAsh1H017410
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 10:54:43 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Oct 2024 03:54:34 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <akapatra@quicinc.com>, <hariramp@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v4 4/6] media: qcom: camss: Restructure camss_link_entities
Date: Wed, 30 Oct 2024 16:23:45 +0530
Message-ID: <20241030105347.2117034-5-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241030105347.2117034-1-quic_vikramsa@quicinc.com>
References: <20241030105347.2117034-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-GUID: Nw-zYhQzI6OalN1uwBK3DACL5E2k2FeU
X-Proofpoint-ORIG-GUID: Nw-zYhQzI6OalN1uwBK3DACL5E2k2FeU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=944
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300085

Refactor the camss_link_entities function by breaking it down into
three distinct functions. Each function will handle the linking of
a specific entity separately, enhancing readability.

Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss.c | 159 ++++++++++++++--------
 1 file changed, 105 insertions(+), 54 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index addaed8f77cb..e4579ce80572 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2164,14 +2164,66 @@ static int camss_init_subdevices(struct camss *camss)
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
+	int i, j;
+	int ret, line_num;
+	u16 src_pad;
+	u16 sink_pad;
+	struct media_entity *src_entity;
+	struct media_entity *sink_entity;
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
+				dev_err(camss->dev,
+					"Failed to link %s->%s entities: %d\n",
+					src_entity->name,
+					sink_entity->name,
+					ret);
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
@@ -2192,71 +2244,70 @@ static int camss_link_entities(struct camss *camss)
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
 					dev_err(camss->dev,
 						"Failed to link %s->%s entities: %d\n",
-						camss->csid[i].subdev.entity.name,
-						camss->ispif->line[j].subdev.entity.name,
+						ispif->entity.name,
+						vfe->entity.name,
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
-- 
2.25.1


