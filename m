Return-Path: <linux-media+bounces-19428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0740399A5F9
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 16:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B3E2B260FB
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 14:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F03421C167;
	Fri, 11 Oct 2024 14:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P0KOSkrV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3019021BB08;
	Fri, 11 Oct 2024 14:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728655847; cv=none; b=QRP5AkNm1SuokOmqvaqmpJiDJxEFNVfXBYbkqaxYEsHO5hLT3uNzPwYhB5VXrPu60WMwsZis+5NgU3656scl0JvjmxtvSJaa8I1jnt8yyr8/KjRPtigqxTGYG7gPEvp2Z/nUyYeAQS7E6cM1Yz6MwCJhbRkigYtUePEfKO2RWNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728655847; c=relaxed/simple;
	bh=baS8TN5DhkPG3ZlO1P+wvAvGcCWnOgVuhQXQoOI//NE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z3CmFC9EYuseDLRNQzUFA1RdXmqnWG2hcFkuO+npgbsCrF+trvq4hCqAUudwehYMe+rOGz29HtmHFPiCzSi+2OUL3dVfkpGQWKDtqI7NqG9mGoj0AriQPfdFRzxzg2I/FXZcy6gwVjqb7/+/XFGz++ON46AyzFT1g9N1s6HiANA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P0KOSkrV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B6oThA023942;
	Fri, 11 Oct 2024 14:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BKFTDHW7naAxdCx8QOlxs+kHojjjDypCigunDcjVTbU=; b=P0KOSkrVzQIGT4HJ
	C2UZspputA6SPSx63CLfMxoRuqCw1lN9JiGzXVBWeCFQmVfMBwHpMpfJj7biAQKo
	3TJ6zWHlMNeLxNs136i/uk+MLEdsL4NXweIlQyMgGTmcFqBPPUNq7jbwwFxJxXAY
	XyMpQzOSWasdl6iyGaRO5sy2/aYfKTDT+K2b/mnghYsUkebakp4PTSvIWUM9wPsl
	BgO9VDME0wQ+C55kFdqO/STjZu9EMCi5loybuclAfxzdmuN0WMwSTWpnjht28YZ2
	EfCvwWfzwIEhYH7oEXTErS11tGg/XU5Fh0cycZdE2GiFcqtw/EAbk/HxhDrkXi/A
	uPpKFw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426y3vsa67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 14:10:35 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49BEAYqo012610
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 14:10:34 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Oct 2024 07:10:25 -0700
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
Subject: [PATCH v3 6/8] media: qcom: camss: Restructure camss_link_entities
Date: Fri, 11 Oct 2024 19:39:30 +0530
Message-ID: <20241011140932.1744124-7-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241011140932.1744124-1-quic_vikramsa@quicinc.com>
References: <20241011140932.1744124-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: jMRHR0gesReZSDbvWzBeMMwATIXVDJWr
X-Proofpoint-GUID: jMRHR0gesReZSDbvWzBeMMwATIXVDJWr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 clxscore=1015 mlxscore=0 phishscore=0 impostorscore=0 adultscore=0
 mlxlogscore=958 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110098

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
index 7ae4a1312e9f..db2710ad0d5c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2152,14 +2152,66 @@ static int camss_init_subdevices(struct camss *camss)
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
@@ -2180,71 +2232,70 @@ static int camss_link_entities(struct camss *camss)
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


