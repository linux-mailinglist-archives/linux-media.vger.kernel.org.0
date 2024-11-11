Return-Path: <linux-media+bounces-21268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 055E49C43E2
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 18:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A5A21F21E2E
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 17:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1E01AA7BF;
	Mon, 11 Nov 2024 17:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BTxH4duz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2891AA788;
	Mon, 11 Nov 2024 17:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731346755; cv=none; b=BEa3tE4mCffmuSJyzn3NtjS2/BkflLntkshBqUZ8Vc/mMrC2og0Naq0JDTyk6yr5BxTmJdXGVxsj0vxaE02MDqNZtNAFjO2rQURQtGBJl2AtbgpK/K4gHUfuCsYrJ1hdb/p0rP4HQ7Ua0AZAEw7yzvq+aXehP6S0DyvrL1d9pTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731346755; c=relaxed/simple;
	bh=lBbzUyMqfHeDD6ko8cw3TFL2RQtuO/mV4Rr1WqZ++08=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uV77hvBnixpf1gJwpkn0P2JFy0uUbivm6FyhTu5C+M62xL8XZHaB3nXeCLq0opmNSePi7bYU2HRTZWvgoYXSPpZioKdvb+8hlP+yJFWUk/YLtnEr9GKL4Vb+1o+nxnBveOOQ+fwd1ltezhFW69hm4E7bTBSCfrYfIof/3/bt4ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BTxH4duz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABBUkq9027315;
	Mon, 11 Nov 2024 17:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nq2M7QKq6EEuAV62YaLr21VLlQSB1WvMDPSk2WFA9DE=; b=BTxH4duzTUmjDLjt
	jbec2dWNfpnhOl9WU/i+HMOpX5ARjg3DvvLIrP680zHl7MbNEo8pq+FAA4ymH4Hh
	jg1C8IrKjfnUxeZWiwOI4AGlUPrGIud6MM0OS29256XgUgJZywFQlCC/hjpEc3DS
	2Epx9idLPxq2m0nCqlFyQpi23d/bROJiwYZLlqSQ9vW7HCtet/BFtALRLu9ych7d
	GvD/2Ur94ERkoZ1jPPuXcvQzbat2u778O2OJYzhB4AOx0j222upzgfwxTRX31xcC
	v2+VCSywJQxfiv1Uw3ozM0cKGv2hMwRfxOspzcaTM9Ubjvr7v+gDoqCjFKSaGdC+
	aXlj1Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sytsmxcw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 17:39:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ABHd85m021957
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 17:39:08 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 11 Nov 2024 09:39:02 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>
CC: <quic_vikramsa@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v1 1/1] media: qcom: camss: Restructure camss_link_entities
Date: Mon, 11 Nov 2024 23:08:45 +0530
Message-ID: <20241111173845.1773553-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241111173845.1773553-1-quic_vikramsa@quicinc.com>
References: <20241111173845.1773553-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-GUID: SV-byBueOOr2E40MG4ait_CY_ab7_2Ty
X-Proofpoint-ORIG-GUID: SV-byBueOOr2E40MG4ait_CY_ab7_2Ty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 mlxlogscore=811 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411110143

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
index fabe034081ed..1052c01b45f3 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1840,14 +1840,66 @@ static int camss_init_subdevices(struct camss *camss)
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
@@ -1868,71 +1920,70 @@ static int camss_link_entities(struct camss *camss)
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


