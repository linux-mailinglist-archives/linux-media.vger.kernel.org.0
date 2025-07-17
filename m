Return-Path: <linux-media+bounces-37929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E01FFB08355
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 05:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25DF94A29C3
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 03:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22FCD1FBE80;
	Thu, 17 Jul 2025 03:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hH38/0qW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D897E1F869E;
	Thu, 17 Jul 2025 03:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752722440; cv=none; b=pGybJe4qOKemrk9pSakTg/iBU1atW97+rwV373KOa1vmF502HnXZq3Yn8Iogn3fWYznS6nnUCLMEGqMo3iZ4I9kw+ufgNjAEgBK45PkVTV6oCFGOXUV6N8Oxmmv9g2L0gLj1s7IUnHHDdNprWEOEObcT9AwHTLujC7tOtibgjws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752722440; c=relaxed/simple;
	bh=ckF+2Y9yqEGPxI5tTrHxV+/ubBHvx6qKx/PzQ41QgiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=G4HBRtF2HbdjMQQkGGR43gJpWBN/ZBLNvf0BM8MYM03xQh78ZiBqeAKGv+8jUsiJgSAQxVAxm3pQsPHUYO1V2JcG0Zxa+dIngF57E0GaXnHt3iBpO+P/QFDJL1XK8mCrnQZk+vWB+/e6JLNhqmEfTnsC0IHGoeGUJ3QbyrZA1Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hH38/0qW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GGDWdu021593;
	Thu, 17 Jul 2025 03:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BZqycXo0SMFxF9O3vzYh96DKrS8tlW1pB4iUiPD4Ty8=; b=hH38/0qW08gS1MOI
	09jGSzZWOKEkZKbseO/RYkeOY+L+NOjcmHSO6VAprFDvPDBcWaDY8B3gvA0MyTNw
	k93xGEgUlH7V75XTCcZdtikJGuVW+9+8ZtjDeOlssVyEtD6BCThrZ8abZCyK+6/I
	kyhMvivB7OJvkGFd5zBTbvtpivczvuSHd9s18q2vj0dp8aUC/jTX+9kt68IX2G5v
	hHlB+Mew1jg9fk63YoeY/Ac2ynznRrShm0qNFMqXCH0rCkgZkvdAX8gO7eJKo0sU
	RoONvds2horNL+jc1rGkXlCDVgGelxC23OqBtUdaXfPvnO9mbHYX7+VRpo6DK1v7
	IobNUw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8dy60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 03:20:34 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56H3KXsg018042
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 03:20:33 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 16 Jul 2025 20:20:31 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Date: Thu, 17 Jul 2025 11:20:06 +0800
Subject: [PATCH v2 2/3] media: qcom: camss: Add link support for TPG common
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250717-lemans_tpg-v2-2-a2538659349c@quicinc.com>
References: <20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com>
In-Reply-To: <20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Wenmeng Liu <quic_wenmliu@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752722425; l=5730;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=ckF+2Y9yqEGPxI5tTrHxV+/ubBHvx6qKx/PzQ41QgiA=;
 b=ePKaEkWmpXFQkre5RoGROO08tK0mLT3UUuowdT+qL55pelv1nXIJKRHIcgPu06PjILw7br1ph
 fqou9tybjLvA/AnD1Kh3SwcPVtSJG/WSfVa5DSx7OJAa282ghrNuzoJ
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDAyOCBTYWx0ZWRfXzTFSCeU+wHf/
 AzIBgZEsmZ9hj56jGU0G9Pt/kzNhKCm9xsJfR1xKrlduafcSeEZcZrprEo+vJZGLC3WOU6MyAJd
 i1bqW+8Y2Zd9sPdBg+EBVHDQkErdrds4dwy5pyzXwfcFYfhaIGzSny4ZMsBGgaXoiSv203dO7HG
 icp0rO15yLxXD40J2oCOT72EoHjMUO9Ljhir6xrL6EpyU7LQo7WlZI/NE7blcptJd5f6xUNkZgR
 qU6K1711DN2kViSZghK4rT4lleQb4Syv+RqGe1YC8yJ7GLDgWnq4QOQJznVTJnzTt1r5+SIrdi3
 KXl8MkugZTwDZ0XiszbM28CypCMqu/OnCgS9fcT/zFH4iigB7TKNqB3oBpQ4VpHBow6i5w9VuGx
 qWIeK3Jt27n90vRqYxHrGg6Ynt589KooNzAAShlx/nB3mlJJuaha8yra1JXeXEosWGfiC9l3
X-Proofpoint-ORIG-GUID: T20DrxxKAoV6tL1bO5hBor6N5-XTF3u0
X-Proofpoint-GUID: T20DrxxKAoV6tL1bO5hBor6N5-XTF3u0
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=68786c02 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=UHgvLbL5fbYktrKlF1kA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170028

TPG is connected to the csid as an entity, the link
needs to be adapted.

Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 44 +++++++++++++++++-----
 drivers/media/platform/qcom/camss/camss.c      | 52 ++++++++++++++++++++++++++
 2 files changed, 87 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 5284b5857368c37c202cd89dad6ae8042b637537..1ee4c4cc61cb32ce731dd8123522cc729d1ae3bb 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1226,6 +1226,23 @@ void msm_csid_get_csid_id(struct media_entity *entity, u8 *id)
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
@@ -1266,6 +1283,7 @@ static int csid_link_setup(struct media_entity *entity,
 		struct csid_device *csid;
 		struct csiphy_device *csiphy;
 		struct csiphy_lanes_cfg *lane_cfg;
+		struct tpg_device *tpg;
 
 		sd = media_entity_to_v4l2_subdev(entity);
 		csid = v4l2_get_subdevdata(sd);
@@ -1277,18 +1295,26 @@ static int csid_link_setup(struct media_entity *entity,
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
index af5c9326736f9c8576816c91b73ad3e1d3a49dbf..34f71039038e881ced9c9f06bd70915b5c5f610f 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3913,6 +3913,19 @@ static int camss_init_subdevices(struct camss *camss)
 		}
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
 	/* note: SM8250 requires VFE to be initialized before CSID */
 	for (i = 0; i < camss->res->vfe_num; i++) {
 		ret = msm_vfe_subdev_init(camss, &camss->vfe[i],
@@ -4002,6 +4015,23 @@ static int camss_link_entities(struct camss *camss)
 		}
 	}
 
+	for (i = 0; i < camss->res->tpg_num; i++) {
+		for (j = 0; j < camss->res->csid_num; j++) {
+			ret = media_create_pad_link(&camss->tpg[i].subdev.entity,
+						    MSM_TPG_PAD_SRC,
+						    &camss->csid[j].subdev.entity,
+						    MSM_CSID_PAD_SINK,
+						    0);
+			if (ret < 0) {
+				camss_link_err(camss,
+					       camss->tpg[i].subdev.entity.name,
+					       camss->csid[j].subdev.entity.name,
+					       ret);
+				return ret;
+			}
+		}
+	}
+
 	if (camss->ispif) {
 		for (i = 0; i < camss->res->csid_num; i++) {
 			for (j = 0; j < camss->ispif->line_num; j++) {
@@ -4106,6 +4136,19 @@ static int camss_register_entities(struct camss *camss)
 		}
 	}
 
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
 	for (i = 0; i < camss->res->csid_num; i++) {
 		ret = msm_csid_register_entity(&camss->csid[i],
 					       &camss->v4l2_dev);
@@ -4149,6 +4192,10 @@ static int camss_register_entities(struct camss *camss)
 	for (i--; i >= 0; i--)
 		msm_csid_unregister_entity(&camss->csid[i]);
 
+	i = camss->res->tpg_num;
+err_reg_tpg:
+	for (i--; i >= 0; i--)
+		msm_tpg_unregister_entity(&camss->tpg[i]);
 	i = camss->res->csiphy_num;
 err_reg_csiphy:
 	for (i--; i >= 0; i--)
@@ -4170,6 +4217,11 @@ static void camss_unregister_entities(struct camss *camss)
 	for (i = 0; i < camss->res->csiphy_num; i++)
 		msm_csiphy_unregister_entity(&camss->csiphy[i]);
 
+	if (camss->tpg) {
+		for (i = 0; i < camss->res->tpg_num; i++)
+			msm_tpg_unregister_entity(&camss->tpg[i]);
+	}
+
 	for (i = 0; i < camss->res->csid_num; i++)
 		msm_csid_unregister_entity(&camss->csid[i]);
 

-- 
2.34.1


