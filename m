Return-Path: <linux-media+bounces-25995-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E2FA3080F
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 11:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89432166C5D
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 10:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222671F3D49;
	Tue, 11 Feb 2025 10:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G8pzNO5W"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3C01F4294;
	Tue, 11 Feb 2025 10:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739268548; cv=none; b=m8mgrZQRmHKZG9lLlVQ0ZySDguqSsZ3dYkf+e6Jm9i5xa3aM0NBsaHKY1L7B3A53Bj3oZ3uba7hWq3zqci/IcDIUGqwtI2z+QhREsg31SCjJS0dgaHIR5xVLeXoUW9fTKGN/A/HUxlntQsAUholBjetrKHpt/w2jLRIb4rz6VjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739268548; c=relaxed/simple;
	bh=V/GN+N5C+ag3ZvDKcET++vWM0XlD+Tsynt561Rx/bbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=mUlqLGdPnaYDbLBIFOWCOOD9OkEOji0T3472twig5u3aB45lrRNF9Y2iaUl2o8gJea7nAidusvfut5MRtT5T1PoqLb9o147f4MXi1EBwkNSlF8yQmlWOfLZY4g25ilgJwVNzsvxK3R1bYdB/woJKpbZjIGO6r0z2RoUyB8hciGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G8pzNO5W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AMxicJ031847;
	Tue, 11 Feb 2025 10:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ePsdIGXHUd+BM4bugnBZInCwG+p9zvsD6rEed6WsWLA=; b=G8pzNO5WQ/Jg+X2z
	ekX+y/dEYB0R5OiRP4L4MmMzqoMbQUwK2x8LV0XHNWIquqID/Jhl0rlEV0tZaZxz
	Kv64NFD1kegrMij5q/UfP8AdYuKSaApRD/tkeIWBu95J70O12Vp+9OzToEYAutlD
	Yy6MpGFrGNmyxNtLkPaC63hJJoVBRn3fxY0JC2ZJDkxkYx/lyWRJ7sjkDcXYykRd
	2Rx16xj8GPVEk8p/MpROZXg3weWoMAlj2E+zqYIuaYs3QFRl0Gl7Wd5EJ4AP4HMl
	a+Y/sdGoWlkeciAeyTcvewqA6DMApTEwVzsK7jg6EpzIgchehrDawI9rTcSe4330
	CVYCCQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qgtk3674-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 10:09:02 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51BA92Lt003678
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 10:09:02 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Feb 2025 02:08:59 -0800
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Date: Tue, 11 Feb 2025 18:07:57 +0800
Subject: [PATCH 2/3] media: qcom: camss: Add link support for TPG common
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250211-sa8775p_tpg-v1-2-3f76c5f8431f@quicinc.com>
References: <20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com>
In-Reply-To: <20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Wenmeng Liu <quic_wenmliu@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739268532; l=5562;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=V/GN+N5C+ag3ZvDKcET++vWM0XlD+Tsynt561Rx/bbs=;
 b=bRVmMzrmoY/LTQAxQ9/2BxtMlJKXHXVCqIpVioySIaM8BJonC/dePMsODLZVqGO9+8+gdyLuW
 jgVqKO5ymUoD8OMg0yl1IcRouEyU9plJgDRXdhDlvaznw7zh9MiVNWR
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FRvRGvdpFd5dlrgG1f8ZtT9aWYDLevko
X-Proofpoint-ORIG-GUID: FRvRGvdpFd5dlrgG1f8ZtT9aWYDLevko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1011 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110062

TPG is connected to the csid as an entity, the link
code needs to be adapted.

Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 44 ++++++++++++++++----
 drivers/media/platform/qcom/camss/camss.c      | 57 ++++++++++++++++++++++++++
 2 files changed, 92 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index e26a69a454a759a6b156b8c736348a0fa4a838b6..2504cf41144d482eb3ad9c91387d4da7db421568 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1225,6 +1225,23 @@ void msm_csid_get_csid_id(struct media_entity *entity, u8 *id)
 	*id = csid->id;
 }
 
+/*
+ * csid_get_csiphy_tpg_lane_assign - Calculate lane assign by tpg lane num
+ * @num - tpg lane num
+ *
+ * Return lane assign
+ */
+static u32 csid_get_csiphy_tpg_lane_assign(int num)
+{
+	u32 lane_assign = 0;
+	int i;
+
+	for (i = (num - 1); i >= 0; i--)
+		lane_assign |= i << (i * 4);
+
+	return lane_assign;
+}
+
 /*
  * csid_get_lane_assign - Calculate CSI2 lane assign configuration parameter
  * @lane_cfg - CSI2 lane configuration
@@ -1265,6 +1282,7 @@ static int csid_link_setup(struct media_entity *entity,
 		struct csid_device *csid;
 		struct csiphy_device *csiphy;
 		struct csiphy_lanes_cfg *lane_cfg;
+		struct tpg_device *tpg;
 
 		sd = media_entity_to_v4l2_subdev(entity);
 		csid = v4l2_get_subdevdata(sd);
@@ -1276,18 +1294,26 @@ static int csid_link_setup(struct media_entity *entity,
 			return -EBUSY;
 
 		sd = media_entity_to_v4l2_subdev(remote->entity);
-		csiphy = v4l2_get_subdevdata(sd);
+		if (strnstr(sd->name, MSM_TPG_NAME, strlen(MSM_TPG_NAME))) {
+			tpg = v4l2_get_subdevdata(sd);
 
-		/* If a sensor is not linked to CSIPHY */
-		/* do no allow a link from CSIPHY to CSID */
-		if (!csiphy->cfg.csi2)
-			return -EPERM;
+			csid->phy.lane_cnt = tpg->res->lane_cnt;
+			csid->phy.csiphy_id = tpg->id;
+			csid->phy.lane_assign = csid_get_csiphy_tpg_lane_assign(csid->phy.lane_cnt);
+		} else {
+			csiphy = v4l2_get_subdevdata(sd);
+
+			/* If a sensor is not linked to CSIPHY */
+			/* do no allow a link from CSIPHY to CSID */
+			if (!csiphy->cfg.csi2)
+				return -EPERM;
 
-		csid->phy.csiphy_id = csiphy->id;
+			csid->phy.csiphy_id = csiphy->id;
 
-		lane_cfg = &csiphy->cfg.csi2->lane_cfg;
-		csid->phy.lane_cnt = lane_cfg->num_data;
-		csid->phy.lane_assign = csid_get_lane_assign(lane_cfg);
+			lane_cfg = &csiphy->cfg.csi2->lane_cfg;
+			csid->phy.lane_cnt = lane_cfg->num_data;
+			csid->phy.lane_assign = csid_get_lane_assign(lane_cfg);
+		}
 	}
 	/* Decide which virtual channels to enable based on which source pads are enabled */
 	if (local->flags & MEDIA_PAD_FL_SOURCE) {
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 4df31c89c20c6d87d9564f217489181cb044abff..1efcc7a5ee62c7aa644b2390832b6f1f29cc69ff 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3038,6 +3038,19 @@ static int camss_init_subdevices(struct camss *camss)
 		return ret;
 	}
 
+	if (camss->tpg) {
+		for (i = 0; i < camss->res->tpg_num; i++) {
+			ret = msm_tpg_subdev_init(camss, &camss->tpg[i],
+						  &res->tpg_res[i], i);
+			if (ret < 0) {
+				dev_err(camss->dev,
+					"Failed to init tpg%d sub-device: %d\n",
+					i, ret);
+				return ret;
+			}
+		}
+	}
+
 	return 0;
 }
 
@@ -3087,6 +3100,25 @@ static int camss_link_entities(struct camss *camss)
 		}
 	}
 
+	if (camss->tpg) {
+		for (i = 0; i < camss->res->tpg_num; i++) {
+			for (j = 0; j < camss->res->csid_num; j++) {
+				ret = media_create_pad_link(&camss->tpg[i].subdev.entity,
+							    MSM_TPG_PAD_SRC,
+							    &camss->csid[j].subdev.entity,
+							    MSM_CSID_PAD_SINK,
+							    0);
+				if (ret < 0) {
+					camss_link_err(camss,
+						       camss->tpg[i].subdev.entity.name,
+						       camss->csid[j].subdev.entity.name,
+						       ret);
+					return ret;
+				}
+			}
+		}
+	}
+
 	if (camss->ispif) {
 		for (i = 0; i < camss->res->csid_num; i++) {
 			for (j = 0; j < camss->ispif->line_num; j++) {
@@ -3180,6 +3212,19 @@ static int camss_register_entities(struct camss *camss)
 	int i;
 	int ret;
 
+	if (camss->tpg) {
+		for (i = 0; i < camss->res->tpg_num; i++) {
+			ret = msm_tpg_register_entity(&camss->tpg[i],
+						      &camss->v4l2_dev);
+			if (ret < 0) {
+				dev_err(camss->dev,
+					"Failed to register tpg%d entity: %d\n",
+					i, ret);
+				goto err_reg_tpg;
+			}
+		}
+	}
+
 	for (i = 0; i < camss->res->csiphy_num; i++) {
 		ret = msm_csiphy_register_entity(&camss->csiphy[i],
 						 &camss->v4l2_dev);
@@ -3239,6 +3284,13 @@ static int camss_register_entities(struct camss *camss)
 	for (i--; i >= 0; i--)
 		msm_csiphy_unregister_entity(&camss->csiphy[i]);
 
+	i = camss->res->tpg_num;
+err_reg_tpg:
+	if (camss->tpg) {
+		for (i--; i >= 0; i--)
+			msm_tpg_unregister_entity(&camss->tpg[i]);
+	}
+
 	return ret;
 }
 
@@ -3252,6 +3304,11 @@ static void camss_unregister_entities(struct camss *camss)
 {
 	unsigned int i;
 
+	if (camss->tpg) {
+		for (i = 0; i < camss->res->tpg_num; i++)
+			msm_tpg_unregister_entity(&camss->tpg[i]);
+	}
+
 	for (i = 0; i < camss->res->csiphy_num; i++)
 		msm_csiphy_unregister_entity(&camss->csiphy[i]);
 

-- 
2.34.1


