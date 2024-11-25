Return-Path: <linux-media+bounces-21966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A6C9D837D
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 11:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C487286098
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 10:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B090198A19;
	Mon, 25 Nov 2024 10:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GhUQ1Ino"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80400195FEF;
	Mon, 25 Nov 2024 10:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732530928; cv=none; b=U9DWD7AcIET3iWE6EAXR7n7hBhWZxogBoHqNarARccojJjgK5+ySBH3sJgWS1dwsf/w9XO/GDLQa9tpoKWbh6rNG9w96HGzDdCvSIdHLL6kjAdpAA+saS3/xrjUD6a5THpuvjFm5bpPSHCfxVEaswcgR+7/w5UQ78NCnN2D8644=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732530928; c=relaxed/simple;
	bh=dki+8zJqg/cTFMdXCf9mZZ1EiauhPIlO7yCRUrJn9Rs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aAv7zdJkEF7IW/rktcp24LR5d2Kj1U4IGghX9elEGFDwdxwLzFuNr7liqHQpjmaFGNtjYpjwQLWuOokxHofYeyQ+nf065F+Utkh0jXM4pqF58aJ9WYGBu3ayyKXzVunGO7BmSDSFBunPle1gnoad6v+VewnVpqfDSK4O4Cg449A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GhUQ1Ino; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP8h9cn014563;
	Mon, 25 Nov 2024 10:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c7TCGC7ykkQ2CGnu0goJ/uDUsv1XfJSMjmGhg9V5wpg=; b=GhUQ1InogJNYHFgi
	QiG76W8xbJxDxi6+oJudTfz8DeL0L9lNnaVF5lWQ9dxyGUYuiX3D4ICijcNybg+j
	bigOsboHaWm3hvtSA0dIikM9uEtxHjn/1wiUCIlVXS3s4v3/pZGkf4Il1vfey4bQ
	bj0ilwPX6cdNwSfdCcU+t2u7eNySK+urlGGI00A6bEgsmDlAFHGAAEoHtQYg1QKB
	l4qfffE6YcayyOj9rP9b9rotdsHBaIbO/VWssu714+lA8boS65tb20QLGmutwc2o
	0j1NO4oLtYoQ9AcMsEZWLFs2dTWaKMOcRm8i+QosIYrpFUG6YrXCouLajYQCgd5s
	Cyg2/g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434nyg0b2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 10:35:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4APAZMxp015275
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 10:35:22 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 25 Nov 2024 02:35:16 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v3 1/2] media: qcom: camss: reducing the repitious error message string
Date: Mon, 25 Nov 2024 16:04:56 +0530
Message-ID: <20241125103457.1970608-2-quic_vikramsa@quicinc.com>
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
X-Proofpoint-GUID: px1sESCKsfqWA4sYUiunaGw1vcNb08Zy
X-Proofpoint-ORIG-GUID: px1sESCKsfqWA4sYUiunaGw1vcNb08Zy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250090

Introducing a new function camss_link_err to avoid repition of
same error message, improving code maintainability.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss.c | 60 ++++++++++++++---------
 1 file changed, 37 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9fb31f4c18ad..520c5bc7a265 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1993,6 +1993,26 @@ static int camss_init_subdevices(struct camss *camss)
 	return 0;
 }
 
+/*
+ * camss_link_entities - Register subdev nodes and create links
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
 /*
  * camss_link_entities - Register subdev nodes and create links
  * @camss: CAMSS device
@@ -2012,11 +2032,10 @@ static int camss_link_entities(struct camss *camss)
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
@@ -2031,11 +2050,10 @@ static int camss_link_entities(struct camss *camss)
 							    MSM_ISPIF_PAD_SINK,
 							    0);
 				if (ret < 0) {
-					dev_err(camss->dev,
-						"Failed to link %s->%s entities: %d\n",
-						camss->csid[i].subdev.entity.name,
-						camss->ispif->line[j].subdev.entity.name,
-						ret);
+					camss_link_err(camss, src_entity->name,
+						       camss->csid[i].subdev.entity.name,
+						       camss->ispif->line[j].subdev.entity.name,
+						       ret);
 					return ret;
 				}
 			}
@@ -2053,11 +2071,9 @@ static int camss_link_entities(struct camss *camss)
 								    MSM_VFE_PAD_SINK,
 								    0);
 					if (ret < 0) {
-						dev_err(camss->dev,
-							"Failed to link %s->%s entities: %d\n",
-							ispif->entity.name,
-							vfe->entity.name,
-							ret);
+						camss_link_err(camss, ispif->entity.name,
+							       vfe->entity.name,
+							       ret);
 						return ret;
 					}
 				}
@@ -2074,11 +2090,9 @@ static int camss_link_entities(struct camss *camss)
 								    MSM_VFE_PAD_SINK,
 								    0);
 					if (ret < 0) {
-						dev_err(camss->dev,
-							"Failed to link %s->%s entities: %d\n",
-							csid->entity.name,
-							vfe->entity.name,
-							ret);
+						camss_link_err(camss, csid->entity.name,
+							       vfe->entity.name,
+							       ret);
 						return ret;
 					}
 				}
@@ -2227,9 +2241,9 @@ static int camss_subdev_notifier_complete(struct v4l2_async_notifier *async)
 				input, MSM_CSIPHY_PAD_SINK,
 				MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
 			if (ret < 0) {
-				dev_err(camss->dev,
-					"Failed to link %s->%s entities: %d\n",
-					sensor->name, input->name, ret);
+				camss_link_err(camss, sensor->name,
+					       input->name,
+					       ret);
 				return ret;
 			}
 		}
-- 
2.25.1


