Return-Path: <linux-media+bounces-43120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3907BB9CE6D
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 02:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB9F52E75F9
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 00:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27522D24A3;
	Thu, 25 Sep 2025 00:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cE7IQikM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0A52D249B
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 00:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758760364; cv=none; b=XAGi1RrOkGabWTMo5uc0akxHM6DAV651fYk0aas31zexztNho1TnVLB1a09L1KFjU9U4KC38VQp74EcVUrafc3pwloyhnsjG6YQaljbW4abJ6UoyazMJmFFItEkOnSGFu90oIs3W3bl6sqoWhnc75/ETdpguvRSvu30+D3NHgCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758760364; c=relaxed/simple;
	bh=gcL/fGPQekLTQNIGUzZcdgTs72eyqB3Ncf8Yq2nY0h4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V0oHf5NQ1mH/svXkPUwsV/WrQ17CHXl5iimtSchh+YKmNdWUtWuulBUDG/96ZWtHGrWIAp0qnGy9gaHSgtdfqcUcN/vW0jC64XKI118rf6/bfkHIb5FqivQMHjnZER4vT1qk7g1br9qDK62Gh3muoY/XWdtJmMaimFRfNaibCok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cE7IQikM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODY2hT029979
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 00:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	25vQWjik0NkorLXRn5b4wPZ1S82r4D/v+C/waXiEV9Q=; b=cE7IQikMprJFp6lZ
	UgXV8X3H3aZY/9riLNEzVUnSqXWZEnLgFoRhtqmrhrQ72KTiebjt1x5Cq5GsZAzm
	Dt3ptqdGOmtIHx+zdRLmGKtAaVPpNGdT6NlktpY9QySW72jImNUru1QeuefMgIGU
	rIzKbbRFVyEuA7He8MfVFiFK7GMflZQO0VnSOjPPYOI7ov/Z+m5N8vDd7q00hnU6
	9hAlwEg8vtCvvcGvwk6ok9ssoS7NYp5n72uGLrEE0lCt2fiJ9c5dDBBEuc8la9Yp
	v5w5HbIpbOCDRfLTclRYgFAFNKXbyFb9yWVr7owh/exBfPDLY+w8zQDT3FIAXJkR
	1RXapA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fp2ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 00:32:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-817ecd47971so394118285a.0
        for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 17:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758760360; x=1759365160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25vQWjik0NkorLXRn5b4wPZ1S82r4D/v+C/waXiEV9Q=;
        b=Rs74CFMgk7MJczT0Nlh3hjDg3y3c4xhLe41yHNimM7iQnn0jQXlOAfC55l4MzYJiK9
         /NoEZ9824TaQOYlYJxnXfPdys1+O/O1URCsoiwyu+2kpSSBkY7S1GuzHSp83Ob1bDfok
         hjFIjBQ9c0nmsloYO86Nl6cKWF3cMEEIed8fDwO7YjA3+26ZQHMmodiGWEVok5CN8LUG
         +3aBN+yP4RtWukH+XNEMdV0K1QCY4lccbvO951ZlpxRh3s0shpmB03Sw3uf5TY95M/Ee
         rvcypbuPRpHV/UPOsZn8TwJ+U1mRz5cQmC5ud9yEm6ALPTdiUuPnvqbdVY1l5/4h+Tyz
         JZFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQ9CtL3tYndoYo4B7t2h6XZAP20MGQarv5XbLd/+eXcdz6XFGRbiN8udlxGzEbG048EdqoZuq7aydxnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YywUgGokUiFnleKOaGbOE72oNwgYUkvVzAQgvCq/xMmFld5+Ls8
	iIKPQ4B7PSznHRkfZeUvxWabalXlntWJewotzkX+yv91kSVR+fP5I56z0tp17J4POP9foKktQ6c
	8ilpDCEgG9yjuAVtAvkU3Cd9ongJohqNyb3wLY8/5ChgJhiKru7BFyiaj6oHBQfbRiA==
X-Gm-Gg: ASbGncsa0n7pGPOmwTkWO6+UmGlrJ82N5COJqMYv+2l3K4nUsfnkY7ZrgYVd/vm4tV/
	BQh5SLxdSse895RJ7L21gTIrt5wX4ymoz1SMYcr+cM6P8BmVyxyvbeUuWr+++HmxQmtpz5ypnnL
	wRktQLCg4DKBM0Xio1WaB4srdvnfyL5fJemKyBBGstktwRfdzrVrycZOPUIYwhUV9wLtyPiwfVq
	piX6j5l605YvI0nCCZsQ2C2oZqt4iTbYENUQ91ebaQoVrLitOwYtkd/zPq2x493JY0eDf9CG/+N
	dV1WBzE4VFm3Q23rDw1hMHouuM7nvRgVkN1OVkHOq5eJZ/me6wOzYOu+o6uC+v3vi8ESXjexwS6
	6ZoubxUpHuO+Ur1Ghptf0lnDsDCoiYkE=
X-Received: by 2002:a05:620a:8086:b0:858:7b81:330d with SMTP id af79cd13be357-85bc193e680mr115418885a.3.1758760360287;
        Wed, 24 Sep 2025 17:32:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENLcPXmOhdL6ZhjGn1eZG+iWuGUyv1RQeGt0nmArM641SCP6fUyjPgICIPEVuxguDYt6i8lw==
X-Received: by 2002:a05:620a:8086:b0:858:7b81:330d with SMTP id af79cd13be357-85bc193e680mr115415585a.3.1758760359772;
        Wed, 24 Sep 2025 17:32:39 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db10872687sm1774501cf.28.2025.09.24.17.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:32:38 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 08:32:00 +0800
Subject: [PATCH v4 2/3] media: qcom: camss: Add link support for TPG common
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-camss_tpg-v4-2-d2eb099902c8@oss.qualcomm.com>
References: <20250925-camss_tpg-v4-0-d2eb099902c8@oss.qualcomm.com>
In-Reply-To: <20250925-camss_tpg-v4-0-d2eb099902c8@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758760347; l=7448;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=gcL/fGPQekLTQNIGUzZcdgTs72eyqB3Ncf8Yq2nY0h4=;
 b=/gaVAmZ54Sdv0l7nUfaPtCfdWc0f0gdGkZbTAKHvTqv7v+nCW2JjBTmj7NtX+OEP4YMtS1UkS
 78d/wCN3+8mAMKG7zR9t5dtSUISEKcrMS4S/JiM5uCNY8T2ST68q6C+
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: U3TGYBS4NbsP1nmXeJB7qJ6em1RoKoMA
X-Proofpoint-GUID: U3TGYBS4NbsP1nmXeJB7qJ6em1RoKoMA
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d48da9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=D-OMaI2VJto731AKaP4A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX7uYTHQlERJT5
 2H31GpLwmy3VbKIMZp2XqTo4JCrXYIgQ2kIVoY6TC2oXYWNoQHyLzS8/5a0XSelgI3TrNX3d/VK
 ecZMosgKwNOFLJ4/KfU+POEeHDx4UIQ67thdc3pFCjqZ4W5hil+Cyg2WX4oDvEg4sWWTRnccaDG
 KAYvQKVT8UVkd4HGJTWDZJlVb34H8+AWmuQAxawJFJoWzZPlKkjqfL66OQaDJShpwfilzwIsmpd
 b07Z7Hw8NLmRa1nDZQAv8jQgnf7UpDwXCa7THJcV7DKn2IuOovcvj2rr3y9e98xCGPUJJfsHvSS
 tKUYyb+FEfWUmmlVIqIkbqzT3o1re+Q1AEPfu0ODCWb/6CXbaGnqUUqyA0VTIBR5wuA6y8E0GIi
 38kqDxtn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

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


