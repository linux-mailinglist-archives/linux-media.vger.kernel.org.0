Return-Path: <linux-media+bounces-49571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30221CDE88A
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 10:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47A44300E787
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 09:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F09828D84F;
	Fri, 26 Dec 2025 09:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hvB5BVvd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XhE7x9rG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E01E13B7A3
	for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 09:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766740777; cv=none; b=WPFScResiz3JufdQnOIJ/voNmoVe6L8LzRWoElNjbwRK3hZU8VjmDHJOefyJLvg5S37w3kKsCXH3+ZNBccGPVBIrgroEe514ED5IrRUMt4lQqCfOwl4e/VOhN73BNa9dzvPvDzueIz+0FchtQWf42wrpjymdglJT0q2UnQrl7DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766740777; c=relaxed/simple;
	bh=eTxcwVlzQOBnGz/0g5KnnF/PMqyyWhweSs9zLsLncSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N5xZqkY67oO08ecaBRH0A2e11441kFCZ7UtqK+lJMgecJYa2/VlxOsCHLIiPQeNuQBhPegcgyKH+GkEqKA+awppvyDuVoSooNSlz8+9/Yqrjih8qXHeMIvPbtHX51lVnhOPxKv6iNpbFRGMW3spK1Rh5CCIrsPKyNBipiGrV/uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hvB5BVvd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XhE7x9rG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ8bqTf655875
	for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 09:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P2cxNG02rqVbK6Xamryhmd9ntHtyFViQL5//XE2P+9U=; b=hvB5BVvd/U+sKTsP
	XOq0yCUe7KnzYzG0I5OdCO2A3NdOpNFJ0mKQb5e9D0UQ2/cN4E/j0z6HSjGZc/j8
	IrL36n3IazfYnPJ8PNOk172NVb+s12y2nIvq2Z6pKw2d+Ql5K6061emquYxyFAx0
	Lp2uTO9Nz9/lHAaymknuXemCALC+Ok4DVX9MhbTlEe6u90ZqFnPDAaS8dKNyhePX
	2usUUP9BK47d72P9aXf7D8y5E9SCiWVKYcM3BJOt4XlYFh/Q2g2A5VOvTQYRltWB
	InI0w84lZgUZdtdrdsbcrIuq+ghE0HtM18g+0TFk3ib/Mo6YbosjHPO/Fgjk1f/P
	Gh/mJQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b9mstgdw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 09:19:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1d2aa793fso193467611cf.3
        for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 01:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766740773; x=1767345573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P2cxNG02rqVbK6Xamryhmd9ntHtyFViQL5//XE2P+9U=;
        b=XhE7x9rG2WxKlT1DzbJkGKA7K7lxAxszAwC2NgeBLqjrOJoSOsL7pIhdsj/+NpWzZH
         /A/Ps7oCCknvv+4+mYZNsrP0GQTfSMZxV1VQ9zdV2lJFq55esdT0x53Max6UT7e539FZ
         ToDQJOFwtbyB6qP0XWqMzW8Whu6tsDl31hbwwhezGkRiWJPh+Qsy7i4Ntrqvtt6/wu1r
         EGHtfdkNnEZuzn22/O31YUINKU41Hi2PVWsstdFwrDDYiUlWPyy9/m0kAcVOpXrU5+wD
         b8d4KIRhMD5sJprmjFtkuHQcZ2Kk2HY9JrkngTz9hFTTYcM/adEB+UeZLKi90sQgfW7A
         qkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766740773; x=1767345573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P2cxNG02rqVbK6Xamryhmd9ntHtyFViQL5//XE2P+9U=;
        b=tDAxhhV18zNt5q+Xk7e0Zm3YF7cxRcRtWDYKmZPX/2qwY0OoeR19g67daQkOd6J2nD
         pb+/EOlteRxDSAZXwSvWlhVesYmOt7yLpfcK8QmZ4v1XqiKYP1F6zCH3FYmjNotNCer/
         ykhgC6zatN7Fz/PPo3G8v5/vbFwueKN49Y07pbnVCA7WPNCArDh5OzOHJnAT8DAUXrlg
         4dUKhoCmm17++siRl6vaK9WBq74p45gXVU6AEbaqOY4dX99Cei2DVXJtL8Y2XEIRMGk/
         1tzO7rtxNUqc9Yhr5u/ybLbqsr0ZzJM3bhNJ8jfXMDrnsIb7aV2SHnqoi5Kte5OUKXp3
         bqag==
X-Forwarded-Encrypted: i=1; AJvYcCWWxNh3kA3ybZpUxkAuPkpFLfV9mejpWuYA3Q/rvp2UQsA9IczVcp84uwu7G2csFNIAXwKwCDnWPsjePg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVf9avIVmA1Dgn+jVvxjiBlkVdrCEBNKpoOudLKAFCSl5p6cUW
	vSq/jQ2iModoywqcx4PogWa+byeawoCQXttvsZ9POj0v5SibNliC95UdvIYtf3HjiZUf6rP10Bj
	63PKgquukp1i1epAK7Eok37HqXh9sazv7lEio5bfPyyshJmmVfgITLCpeI+TL28ZVGw==
X-Gm-Gg: AY/fxX4Bb+bKUhePKAoTmJoYhmPfZyyQleINUmKVfUBa100rCsEy0rGZcta+qvvD6Cd
	U+kjDTTmedgejf+neg8Tgkb6SMvmswWswhdUrb492rH4a7ISx2PWBwdvOLxGKWlM+K0NgXoqgws
	Tqr1p8umZWm2GefgNPkiFT1/DS43vFYsfMr3nzuGdSgRo1PYn4/y+kWtWQqAVmEhyks4rbGVKJQ
	Juf5WR81JlvcbEvZFgp+ZgxDTykrhzsySMtenDY/7uscTVvrExrDTZuUOA96SHbf8H0Rlpx87xH
	3PmAoEBJJO1MRoqjtIi2RIc7RI2D3FEx/9fmZTfRnjwgscFryXM1SmVbjsJ7ASvAKG7RmW2Mvjy
	WLP9uiRBuEaKC9lowlpnlyvRcoP4BIrPQpd3yz6EfXZ/FPDtGfWEmtcmljiLgVm7nNm2cGNWu4K
	xA
X-Received: by 2002:a05:622a:410f:b0:4ee:fe8:9348 with SMTP id d75a77b69052e-4f4abdb47b4mr312984811cf.72.1766740773198;
        Fri, 26 Dec 2025 01:19:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjEyTBUNEbm5GQAVKxyJf/GJ0VKnuoCJ/KTNiktQ/gHv6ZlibzELyHUqz6stsxQNFCCz5M0Q==
X-Received: by 2002:a05:622a:410f:b0:4ee:fe8:9348 with SMTP id d75a77b69052e-4f4abdb47b4mr312984581cf.72.1766740772319;
        Fri, 26 Dec 2025 01:19:32 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac62d53dsm160612891cf.19.2025.12.26.01.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 01:19:31 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 17:19:11 +0800
Subject: [PATCH v7 2/3] media: qcom: camss: Add link support for TPG
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-camss_tpg-v7-2-ccb536734805@oss.qualcomm.com>
References: <20251226-camss_tpg-v7-0-ccb536734805@oss.qualcomm.com>
In-Reply-To: <20251226-camss_tpg-v7-0-ccb536734805@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766740760; l=7489;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=eTxcwVlzQOBnGz/0g5KnnF/PMqyyWhweSs9zLsLncSs=;
 b=5AA7vOJb2UKzRlRfJwLFcsFGksZ7qv7WNYTCSWu0vcYjWGWNSQbkxzywyUGAlXYT6xumIqNZp
 w6kaqXN4f0jCt8oI/H0CowjVSWjKB1wIhzVHperMBG/qYY/zxDXSs/v
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDA4NiBTYWx0ZWRfX/imrLbO24NKn
 iol2KghXbvvgQ0JeCb7ql+H7DfNrduhBfZXQ3tefExahKx1W0c64lgWoVCHlpNKiWWs1DcOGSDE
 SXC6RdpOBW9Wbxpk+te5Lo7S+9rLevRciRIS7wEPEJuBDLR1MyiiMyWo5nlnirDar3PeOMBSkjj
 fmE97PSyl+b9slx4VbNbogXgzi1fdHYxgQrbR0S4twZFheN0LbOAzqNVVv96ZEOxagZuucMskOw
 iPAegv9LVwVFyynof28U4uF6uI7zpKcc3J7NCSf7AuAURcv3wP2nOfb5p0uZRZu+9R7w/epQMLz
 0AW18314Oya8mIGcJXCvsQuzcFbg8yHQbpBIU6wggCyV+cYf/mIrsUZeU+3xovlo2sPhfgEuIyE
 MgPvkM8EHG6FpFm1rY+7OYD/f/zLcgTiP6tHcm8DzC/57DZAlRfS9wh/cV+UiOm9PcoCHntocPv
 hxrqmHmGm2jREyQ5qZQ==
X-Proofpoint-ORIG-GUID: lyZ7DCJBku61404lUke5ky-D87ZP6sus
X-Proofpoint-GUID: lyZ7DCJBku61404lUke5ky-D87ZP6sus
X-Authority-Analysis: v=2.4 cv=eMkeTXp1 c=1 sm=1 tr=0 ts=694e5326 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=D-OMaI2VJto731AKaP4A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260086

TPG is connected to the csid as an entity, the link
needs to be adapted.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c   | 43 ++++++++++++------
 drivers/media/platform/qcom/camss/camss-csiphy.c |  1 +
 drivers/media/platform/qcom/camss/camss-csiphy.h |  2 +
 drivers/media/platform/qcom/camss/camss.c        | 55 ++++++++++++++++++++++++
 4 files changed, 87 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 5284b5857368c37c202cd89dad6ae8042b637537..aea3267289ff887330480fddf3f8e35d9dda69e0 100644
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
+static u32 csid_get_lane_assign(struct csiphy_lanes_cfg *lane_cfg, int num_lanes)
 {
 	u32 lane_assign = 0;
+	int pos;
 	int i;
 
-	for (i = 0; i < lane_cfg->num_data; i++)
-		lane_assign |= lane_cfg->data[i].pos << (i * 4);
+	for (i = 0; i < num_lanes; i++) {
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
+			csid->phy.lane_assign = csid_get_lane_assign(NULL, csid->phy.lane_cnt);
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
+			csid->phy.lane_assign = csid_get_lane_assign(lane_cfg, lane_cfg->num_data);
+		}
 	}
 	/* Decide which virtual channels to enable based on which source pads are enabled */
 	if (local->flags & MEDIA_PAD_FL_SOURCE) {
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index a734fb7dde0a492cf6e33f53e379557665d54f64..c15990d9d09cc8f9960729bdc112d81751b4938c 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -800,6 +800,7 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
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
index fcc2b2c3cba076e598bc8aacd34efce5d71713ca..43fdcb9af101ef34b118035ca9c68757b66118df 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4145,6 +4145,19 @@ static int camss_init_subdevices(struct camss *camss)
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
@@ -4233,6 +4246,23 @@ static int camss_link_entities(struct camss *camss)
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
@@ -4337,6 +4367,19 @@ static int camss_register_entities(struct camss *camss)
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
@@ -4380,6 +4423,13 @@ static int camss_register_entities(struct camss *camss)
 	for (i--; i >= 0; i--)
 		msm_csid_unregister_entity(&camss->csid[i]);
 
+	i = camss->res->tpg_num;
+err_reg_tpg:
+	if (camss->tpg) {
+		for (i--; i >= 0; i--)
+			msm_tpg_unregister_entity(&camss->tpg[i]);
+	}
+
 	i = camss->res->csiphy_num;
 err_reg_csiphy:
 	for (i--; i >= 0; i--)
@@ -4401,6 +4451,11 @@ static void camss_unregister_entities(struct camss *camss)
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


