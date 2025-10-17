Return-Path: <linux-media+bounces-44787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2AABE65CF
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 07:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3461D354246
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 05:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9862030EF95;
	Fri, 17 Oct 2025 05:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHiQ2Fo2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3775D30E0F8
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 05:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760677582; cv=none; b=gT6uoaCrr7mTbyb5hc483E/cMYUJ51AifGFlkZGakYO7TXmcfGPUtBjfrcVcI8b1clo4ZVH6/N3VR2VARKgMiVOkgbc8NVuc8fgS52YSwgNCq8SBiTOXFaBKIlWSVhR2A7zt0rZHrWn1rx3I0BwCPb8IxXHmzrDF4ViJ3uKinCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760677582; c=relaxed/simple;
	bh=gcL/fGPQekLTQNIGUzZcdgTs72eyqB3Ncf8Yq2nY0h4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RP7mtIvbs9m8w9Ov/GjuBghUxIy7MfRyvZUarnth6ct3ohbjTKbZd28yeGCeuHegMWJBtnnt82KCqiTpBTgqAmjndX9HCxVl7xZULZjacrib/f0wLE67oQ++EB3jqUWiq2t0OjtXWUJM0cmdoEWdxLl4mZHECmURqvoIblSuFjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHiQ2Fo2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLiMV020546
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 05:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	25vQWjik0NkorLXRn5b4wPZ1S82r4D/v+C/waXiEV9Q=; b=cHiQ2Fo2xS7+oPKa
	NY5FJacszjQdOVgS44VvvuEy8IfPAPINeNIkQnehgP0b9mQvuOLO1aR9cvOR6V4T
	nyhPm60JdrtHIV58I1hTZ1JNkhOFLjF3ZHhQZgenA2n+HzXJFxkAxYzKhO4L3QfC
	gl2Rn+7bC4BGqrc5Fuu8DWyTRYHKNjaNkLMTztNGH6Vw1weQ8fVoG3IC5rw3nZ36
	Uu1DndDm+6qPpu3aVSr1ffWX4t3Eq9z0Qbkr2+/vnPszVLniFf13XPIkMI+jiozI
	6d7uwrbrNCAr/oAPxaBQpXaELCtbsqPhCBs/wzKHHHzd/fza5TALc5kuskqPQ4KD
	S2dg9A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49tqvpma99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 05:06:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87c1f435b6bso17903346d6.1
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 22:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760677578; x=1761282378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25vQWjik0NkorLXRn5b4wPZ1S82r4D/v+C/waXiEV9Q=;
        b=H7cDm+yFV8JX42ADSOqKqUwFniIXRib3CvMK1I83erePLihbUe8o08SP3YG3XhbUsZ
         4AZ8vmxDzlz3FmRpetrEC80ARbcTbkAZV63PINsxcOEMY04cGlqbiKgrhABJelq3fGC6
         pGCqOBoCZawxJy79voT0BHMPe8bPAt0ktgyqN7UevpYTlHThxVHdYhmlHnC60kpc3DNF
         +f5Xc27yAiJHVeqxLExygtyxuFzpbFuBUF79JpyeXB1DcJXdCatK6u3zY841QLkZCmmv
         6EZWOKln/BfEip5PzCqly89lpbJZKcswfKPNnj/INu9wsvFesioodUY7OI/NKnBWQ3xE
         4Z3w==
X-Forwarded-Encrypted: i=1; AJvYcCV82VNCcQS5gC/a2RDE2WaSdSNWzvivk09xge9q77RGZtJdskwHGliwOzSh2Ywyz8LGJzfPh4LKBPDq8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjI2j8ZvE1fGQVJtIWdbVPL99YnkcG0uadKU0XMqcV27w6Fcev
	BuMbH9lBDurix0JCJBDEVs7pehZ71VchSJq8bNiFhpxmHpuP/8AM9K3EVqeWMbR4EmXaiJ1n6Iv
	TBkeryQ3G1vw08tnpAQySp8Od5HjmGE/oqH2poH1szsj3enVq1wnt6qw2oFd8cMEjNQ==
X-Gm-Gg: ASbGncubnHFWhckyQtSeunyXzdx2FGtt9ZUz6DzknXtiteKkmR4bZAY78kqX+67XZGJ
	jjcszNq20otNdANBxsIkuEuahAGOqyRdA8azg+dsW7s4tio+Kw+TYkG+TEor7VsHTlLt7OAhQwN
	HzRAjw5KnrtiAuijoI53X/rvwUBeoNPOK+P1Q8J1TZXXYGBB45OU6RFB1Vec14APnRQxVL3LbvT
	T6sjJfHb6KT4lHeh82a/Y0guxvK+np7zkvN44cDbpPJymwiHFJhtdBel5jL51zJYKodt7zqcOHE
	Q58/+nXxivDl0xKFXeOrYWAOVIAiOPYQcMdUKQ7fHcW1d2C+UyqvlqqPxOME599sWx4Opsf0nhH
	OdlQejV9wxsCtg6on57Ef8IUrppurPEU/r18FKsUXsoALfPyE5EkjwAXA6DjqNm6aPQ==
X-Received: by 2002:ac8:578b:0:b0:4e5:6c5e:430a with SMTP id d75a77b69052e-4e89d3a47c8mr36061861cf.64.1760677578245;
        Thu, 16 Oct 2025 22:06:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWoFJ0er3XmNA2MfPambnFGk+UHtKnSzrmBzbda9gHXA03fZsIi/ofXmuuwW4bOSbI87KnLg==
X-Received: by 2002:ac8:578b:0:b0:4e5:6c5e:430a with SMTP id d75a77b69052e-4e89d3a47c8mr36061541cf.64.1760677577565;
        Thu, 16 Oct 2025 22:06:17 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0128c9d8sm57641916d6.33.2025.10.16.22.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 22:06:17 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 13:06:02 +0800
Subject: [PATCH v5 2/3] media: qcom: camss: Add link support for TPG
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-camss_tpg-v5-2-cafe3ad42163@oss.qualcomm.com>
References: <20251017-camss_tpg-v5-0-cafe3ad42163@oss.qualcomm.com>
In-Reply-To: <20251017-camss_tpg-v5-0-cafe3ad42163@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760677563; l=7448;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=gcL/fGPQekLTQNIGUzZcdgTs72eyqB3Ncf8Yq2nY0h4=;
 b=Heo9ljOtLQ/JcSwEKehl45lcRkeQ9+98sYsrLAB3G/8XiHBm9U+DwtH61jDTyI40g6e7sT+wo
 8OwvzboEzMbA7s6sM5EwqbQ3iH2aUibjcUR5/u2OjohrU5/ysKmnPW5
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=aPD9aL9m c=1 sm=1 tr=0 ts=68f1cecb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=D-OMaI2VJto731AKaP4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDAxNyBTYWx0ZWRfXwq1kKXTAgTGE
 kULv+93O0aFNI4vIjKW2OofSy23G3wvTdoetp0t600PoXgskqoS4uNaYEbdxrv5WKf7Q1jVvrWV
 QTb+RHmDEbceEMJZdM5jc0oY3Itx/nhSucWYYSyesInwV4rT/WPOscyANsb2rlNhBsZQm+Am+BD
 L7AR6Aoo29JZI9GAkmyY0bczzBUNJ/+zIxzYng4XXQ4pUa34gB8+6i85JlmElpgbS3/gmCo1Hqz
 ZfnzOJsSOoauLfiA4/g7oTwD4827GeNfMDG1WgibLUsiOysTJrVHnPBrO1tYepj+FLNezpxQCdh
 CG3o11Sg5wJk+IOXGjJa9lGJptvW69Dh7ahqk68WlUoiYP0tNhtZd8itTVY5HO/ytV1gaUXvtL+
 M8tHzqseARWHhTt29ZYcTQJzjzBFIw==
X-Proofpoint-ORIG-GUID: 5yhQqPL3mJrB3-Z63eCa8_5Unv9HDjag
X-Proofpoint-GUID: 5yhQqPL3mJrB3-Z63eCa8_5Unv9HDjag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510160017

TPG is connected to the csid as an entity, the link
needs to be adapted.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c   | 43 +++++++++++++-------
 drivers/media/platform/qcom/camss/camss-csiphy.c |  1 +
 drivers/media/platform/qcom/camss/camss-csiphy.h |  2 +
 drivers/media/platform/qcom/camss/camss.c        | 52 ++++++++++++++++++++++++
 4 files changed, 84 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 5284b5857368c37c202cd89dad6ae8042b637537..196cbc0b60e9bf95a06b053c69c967e345ffcd4b 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -35,6 +35,8 @@
 #define		HW_VERSION_REVISION	16
 #define		HW_VERSION_GENERATION	28
 
+#define LANE_CFG_BITWIDTH 4
+
 #define MSM_CSID_NAME "msm_csid"
 
 const char * const csid_testgen_modes[] = {
@@ -1227,18 +1229,22 @@ void msm_csid_get_csid_id(struct media_entity *entity, u8 *id)
 }
 
 /*
- * csid_get_lane_assign - Calculate CSI2 lane assign configuration parameter
- * @lane_cfg - CSI2 lane configuration
+ * csid_get_lane_assign - Calculate lane assign by csiphy/tpg lane num
+ * @num: lane num
+ * @pos_array: Array of lane positions
  *
  * Return lane assign
  */
-static u32 csid_get_lane_assign(struct csiphy_lanes_cfg *lane_cfg)
+static u32 csid_get_lane_assign(int num, struct csiphy_lanes_cfg *lane_cfg)
 {
 	u32 lane_assign = 0;
+	int pos;
 	int i;
 
-	for (i = 0; i < lane_cfg->num_data; i++)
-		lane_assign |= lane_cfg->data[i].pos << (i * 4);
+	for (i = 0; i < num; i++) {
+		pos = lane_cfg ? lane_cfg->data[i].pos : i;
+		lane_assign |= pos << (i * LANE_CFG_BITWIDTH);
+	}
 
 	return lane_assign;
 }
@@ -1266,6 +1272,7 @@ static int csid_link_setup(struct media_entity *entity,
 		struct csid_device *csid;
 		struct csiphy_device *csiphy;
 		struct csiphy_lanes_cfg *lane_cfg;
+		struct tpg_device *tpg;
 
 		sd = media_entity_to_v4l2_subdev(entity);
 		csid = v4l2_get_subdevdata(sd);
@@ -1277,18 +1284,26 @@ static int csid_link_setup(struct media_entity *entity,
 			return -EBUSY;
 
 		sd = media_entity_to_v4l2_subdev(remote->entity);
-		csiphy = v4l2_get_subdevdata(sd);
+		if (sd->grp_id == TPG_GUP_ID) {
+			tpg = v4l2_get_subdevdata(sd);
 
-		/* If a sensor is not linked to CSIPHY */
-		/* do no allow a link from CSIPHY to CSID */
-		if (!csiphy->cfg.csi2)
-			return -EPERM;
+			csid->phy.lane_cnt = tpg->res->lane_cnt;
+			csid->phy.csiphy_id = tpg->id;
+			csid->phy.lane_assign = csid_get_lane_assign(csid->phy.lane_cnt, NULL);
+		} else {
+			csiphy = v4l2_get_subdevdata(sd);
 
-		csid->phy.csiphy_id = csiphy->id;
+			/* If a sensor is not linked to CSIPHY */
+			/* do no allow a link from CSIPHY to CSID */
+			if (!csiphy->cfg.csi2)
+				return -EPERM;
 
-		lane_cfg = &csiphy->cfg.csi2->lane_cfg;
-		csid->phy.lane_cnt = lane_cfg->num_data;
-		csid->phy.lane_assign = csid_get_lane_assign(lane_cfg);
+			csid->phy.csiphy_id = csiphy->id;
+
+			lane_cfg = &csiphy->cfg.csi2->lane_cfg;
+			csid->phy.lane_cnt = lane_cfg->num_data;
+			csid->phy.lane_assign = csid_get_lane_assign(lane_cfg->num_data, lane_cfg);
+		}
 	}
 	/* Decide which virtual channels to enable based on which source pads are enabled */
 	if (local->flags & MEDIA_PAD_FL_SOURCE) {
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 2de97f58f9ae4f91e8bba39dcadf92bea8cf6f73..680580d7fe46a215777f3fa1b347f4297deea024 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -799,6 +799,7 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
 		 MSM_CSIPHY_NAME, csiphy->id);
+	sd->grp_id = CSIPHY_GUP_ID;
 	v4l2_set_subdevdata(sd, csiphy);
 
 	ret = csiphy_init_formats(sd, NULL);
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 895f80003c441dcacf98435f91567f90afa29279..b7bcf2bdd2124f77b5354b15b33aa1e0983143e8 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -21,6 +21,8 @@
 #define MSM_CSIPHY_PAD_SRC 1
 #define MSM_CSIPHY_PADS_NUM 2
 
+#define CSIPHY_GUP_ID 1
+
 struct csiphy_lane {
 	u8 pos;
 	u8 pol;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2fbcd0e343aac9620a5a30719c42e1b887cf34ed..2ede19e1347ae32f2f6919905b535352bcd134be 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3691,6 +3691,19 @@ static int camss_init_subdevices(struct camss *camss)
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
@@ -3779,6 +3792,23 @@ static int camss_link_entities(struct camss *camss)
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
@@ -3883,6 +3913,19 @@ static int camss_register_entities(struct camss *camss)
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
@@ -3926,6 +3969,10 @@ static int camss_register_entities(struct camss *camss)
 	for (i--; i >= 0; i--)
 		msm_csid_unregister_entity(&camss->csid[i]);
 
+	i = camss->res->tpg_num;
+err_reg_tpg:
+	for (i--; i >= 0; i--)
+		msm_tpg_unregister_entity(&camss->tpg[i]);
 	i = camss->res->csiphy_num;
 err_reg_csiphy:
 	for (i--; i >= 0; i--)
@@ -3947,6 +3994,11 @@ static void camss_unregister_entities(struct camss *camss)
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


