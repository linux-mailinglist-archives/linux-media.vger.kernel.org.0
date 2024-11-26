Return-Path: <linux-media+bounces-22076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBE79D9508
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 11:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AACA1165D81
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 10:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206A51C8FCE;
	Tue, 26 Nov 2024 10:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VaMoQpdx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E9A1BDA8D;
	Tue, 26 Nov 2024 10:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732615320; cv=none; b=kdVmMfQhpUm5+v1pn7b6SJ5nNLqCIHa6EMeO7iIaC4FOTLgecOxWIyzCM4DTtR1mb2PUONIye6k3NUyJxxew4GSWsm28emZJ1EuEpyuVjQlbJ9IyXFjVDSrHFq1/ug/hOdNzpjp2XJhulCZdrvmBfS22xghDmC8sw/27clM3Q1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732615320; c=relaxed/simple;
	bh=Yyc3Gz7iGK6i1vm4jHbYF5aV8SzB2ca438B0Gcpedto=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u4j2hYakgulqhWEMiXUXwVcWQgGv3kE2winFVZSZLtME72vqN3p7MKdQCGLA3gG5kboO8lXxtCbo+9ghrdwggDrMns6cRm37QX2Xn59j3QJf+dRBlYphA4LsvfSfpZlTl5GPYTiDDbGmXQiBNkxsKr9MV6djWOQleT/BrYwye8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VaMoQpdx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APMLAww002125;
	Tue, 26 Nov 2024 10:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4JGeICMYMseYlCuxdRXRRcy1Q5MO5huLDv8M2QUgro=; b=VaMoQpdxr5tS1tLK
	lB2nKcOSskPvK4Awhpl8/JokvARSN7iDWQ/mH4wZMhl9s6KiJn0ASjT+0xvqBro5
	GUOpZccnHKd0GYhwsMGxOI9NhRFRghy52nDVo/+bpUIrePD0F3m1xXf9FBzk5KcO
	znl3/ZDWNhhgvaNTA5fU/MyuJyDK3248bdGfdlAF5dq77V7rhme6Q4G3LQhYSQ9z
	sdoGU7RKvbAaAgCy6AXgL2EJYhddpvQAji+vpAwgQAEfryB8WZh9h/WGQyPcgUjZ
	CH3VYlxOYSEqfrC1r1CyTyDbZTS9kU42/S17I8E8tNwOuzL8zYjWEoF1Kmd4DSVo
	F4O/dA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4336mxfkcr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 10:01:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQA1peG008456
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 10:01:51 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 26 Nov 2024 02:01:46 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v4 1/2] media: qcom: camss: reducing the repitious error message string
Date: Tue, 26 Nov 2024 15:31:25 +0530
Message-ID: <20241126100126.2743795-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241126100126.2743795-1-quic_vikramsa@quicinc.com>
References: <20241126100126.2743795-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: u_0NXg2VqIWpkJVlm8CzCPFmN8NwIMaA
X-Proofpoint-GUID: u_0NXg2VqIWpkJVlm8CzCPFmN8NwIMaA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 adultscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411260079

Introducing a new function camss_link_err to avoid repition of
same error message, improving code maintainability.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 58 ++++++++++++++---------
 1 file changed, 35 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9fb31f4c18ad..6824ffbdf4a8 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1993,6 +1993,24 @@ static int camss_init_subdevices(struct camss *camss)
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
@@ -2012,11 +2030,10 @@ static int camss_link_entities(struct camss *camss)
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
@@ -2031,11 +2048,10 @@ static int camss_link_entities(struct camss *camss)
 							    MSM_ISPIF_PAD_SINK,
 							    0);
 				if (ret < 0) {
-					dev_err(camss->dev,
-						"Failed to link %s->%s entities: %d\n",
-						camss->csid[i].subdev.entity.name,
-						camss->ispif->line[j].subdev.entity.name,
-						ret);
+					camss_link_err(camss,
+						       camss->csid[i].subdev.entity.name,
+						       camss->ispif->line[j].subdev.entity.name,
+						       ret);
 					return ret;
 				}
 			}
@@ -2053,11 +2069,9 @@ static int camss_link_entities(struct camss *camss)
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
@@ -2074,11 +2088,9 @@ static int camss_link_entities(struct camss *camss)
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
@@ -2227,9 +2239,9 @@ static int camss_subdev_notifier_complete(struct v4l2_async_notifier *async)
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


