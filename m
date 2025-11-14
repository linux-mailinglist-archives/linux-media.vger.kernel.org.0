Return-Path: <linux-media+bounces-47056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDB3C5BB2E
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 08:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2D4E3AAFD3
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 07:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35D12F5499;
	Fri, 14 Nov 2025 07:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iWo8tPpy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CboLhZzZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741D92F4A06
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 07:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763104300; cv=none; b=YZeRN3Wc/JnIVWAC3NJCCUJCYuPreRaCQor401HEj55ANzcAIKByNjeec+v9vfvssFeHWmFJ4QZHPIQSyDmLy62OFyCQUb7X/WKoQYHY11wXIKOhIH00uWddo6HEl9H7/hGsXOUOEVGEpfoSc1qhVuDfbRwlICXDwk9C6b8+ims=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763104300; c=relaxed/simple;
	bh=eTxcwVlzQOBnGz/0g5KnnF/PMqyyWhweSs9zLsLncSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EuwHYLoM9AD5L+YqNnI6Sby+2Squng8oqJdblDiFozxTZKzjcV0L2W2UaVGPi8aPw1H2HsCXoZoOxPqtupYXO5i+TFPenyhHgau4pl84Nwlz5bigmlQIjNiid0wjtOn39BTBR1K/FwHqy3gxPNdTigAWb0AtX/aWYNgNiNQg6VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iWo8tPpy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CboLhZzZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMaeN01629391
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 07:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P2cxNG02rqVbK6Xamryhmd9ntHtyFViQL5//XE2P+9U=; b=iWo8tPpytw0rplvR
	LuR6pB6gfyQ1QLkNfws0i3ptdnakpvBVi4+0DHckgsn9stuq2ahjAmbyVCT/2Fl+
	BF0YobNSJHOQtthmC3wrBxKSzAIqCIk39hVLctFrby3+gQNv8/AeRVDepMu1ZQ2p
	aRwwirmp1zce2ySEi0bDNalP/av08ILDDqVdSZeD1exTFeJNmuxQ4/R6mLpry37r
	IRFduY55mh1Epya3HefoRZXRJCuEC6GmqFTedxXOcJwaUokAQsUxxz9T91x9irsT
	n8Nx1tJ/ZRv495GfD6cuoEkjRqKr3ZBFbn0cBume7NZDUfAPUsf03X6+e5qCPwgG
	6UcWjA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9d97at-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 07:11:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88041f9e686so33331846d6.1
        for <linux-media@vger.kernel.org>; Thu, 13 Nov 2025 23:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763104297; x=1763709097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P2cxNG02rqVbK6Xamryhmd9ntHtyFViQL5//XE2P+9U=;
        b=CboLhZzZ969oTMRsvr16sX1Fsh1eIwyfYS/yytO9cr9b6dIXxmSdsZqFRsXarj19SX
         uiKJKczInvNnXOxTjSyBBI7f8QVoUaeiSp4000KuUnQkfexkdQN8b8DH3O7b3LXjHAAm
         bjREuFWhMrSEokZdEn/MwJXreicp0nYFRg7/ivumRbiRLBSMILAnNvAMrNJTw6eE32z+
         inZdSZwVaWwFm2NTMamTdG1+EcYJik7LLuub8eEHmoAHnEzexyRUit9PWbLkClrg4tvA
         HQagIyKLziz+WaEVwd32z9tz2blLTVYdv/bGiGUHnsmiAIplM0poFn3JgI6pEKwryejD
         iiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763104297; x=1763709097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P2cxNG02rqVbK6Xamryhmd9ntHtyFViQL5//XE2P+9U=;
        b=EyXUmndiiqh3I7GPfeQvNhYLSNljz1WkV+AcYmXLWJ/mMfKE+ff5yROjyT55dYIokn
         87pdFuXDPnYf86FTm+RaSLY6Qr9bniJibW7Dbps6WiE5MJXCJ3u8RrIWAGwzHb2VmuuI
         /CbEt9KdQ1FFMwIwyKe3ECfHzu6Y+93cLQhG2UL5sBA2VO7Jz/QGBBPHcG+YiCGhw9Kg
         1Zg64ScBBd/Xql9Rav5o/zQjFqiz4GWGpm0smUNqLleBviyxs0O8S8rZtmVMiy1iAw0G
         I5LAN+RIMFxhvmam8+DFASpToA7YKz4Z6y14lQrrIWHyfHPZDUilpUFX6SEu3LA2QT8v
         5Zsw==
X-Forwarded-Encrypted: i=1; AJvYcCU4D1+2DhHF/eespfcoh/UAiDMTWw5S+PYXV4yZ0n7ow/6tzq+95LDdrs+GgpJmzEMUu6PY93tJdVd9+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtU0kHDdlLjmE7iv1/DH5IkBp5DLhaSAHbGY2cFQMFan2+l+h5
	Ry3ANpCrn8lSrD6a9Va2AXdFhaYxJS0w0K0wCC7Q0tIt3dKRhYq9qOuEH45IzMOb0wa9izHM/OI
	FG+5J2mkyWjHa/ayN8TSlDwrFFM0UU3EibECJWL3Ci/RGfiXsnYSKgH5QXrq9OrWOiQ==
X-Gm-Gg: ASbGncvayAxAwUk3HVvcp3RUMeymSdyLmkofdG7E0ton9WqG9mYRkv+WgqxWwt92QlK
	r2St82L+bYAWochuMvVNvMwsj+qsuboGBUBjWi8DmaWBFQybJ+En+ipnOMsI/FDkDfZTo8ypY21
	/xIzYuwFw8os2/p1Y5N7blk7wFrxkixhx4QkhTMnSnKgTinlKt0SgXAOzO21/rnQPB0XniMLVFC
	vUD4HG7ZeZNw365C9Vb6mb8u+yvpSwnMPBG9Da28UEWLba9lL85gKolxuxNS1Fezg68gJoXEx6W
	W9DMYXUjpCbdiI24JzHqieptX5DgHbxDJaymObSIk9LN6HpeZhzQYxoJLU9nGZQudN9JXDD/Q2W
	mELSYc3TF857NruO566BLhQXxeR3xxI+O6m1mgViWfms45xduTAK+4dNLr9q+TBbYwg==
X-Received: by 2002:a05:6214:d8e:b0:7d2:e1e6:f79f with SMTP id 6a1803df08f44-88292698c76mr25592846d6.47.1763104296525;
        Thu, 13 Nov 2025 23:11:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsgG9pi01gCNpzs+G5nsmU/zFJkM5Z65NF6uhZctdBPeUne6WFTTsV8ipn9k95oGTPIxw96w==
X-Received: by 2002:a05:6214:d8e:b0:7d2:e1e6:f79f with SMTP id 6a1803df08f44-88292698c76mr25592626d6.47.1763104296007;
        Thu, 13 Nov 2025 23:11:36 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-882862ce056sm26336666d6.6.2025.11.13.23.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:11:35 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 15:11:19 +0800
Subject: [PATCH v6 2/3] media: qcom: camss: Add link support for TPG
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-camss_tpg-v6-2-38d3d9fbe339@oss.qualcomm.com>
References: <20251114-camss_tpg-v6-0-38d3d9fbe339@oss.qualcomm.com>
In-Reply-To: <20251114-camss_tpg-v6-0-38d3d9fbe339@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763104282; l=7489;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=eTxcwVlzQOBnGz/0g5KnnF/PMqyyWhweSs9zLsLncSs=;
 b=VG9DEvoFjekbys0i/dppAAcGpLMs0589AKDsTcUihFaMmMbD2Vaquvasb2x4h3Mi+bP/G9HOX
 6HH5jFiE0ZVB9H2Y5qzOlCYTJbOFnG8yGYuIfOX35yvXmEF17wXfUb/
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: _AhUiUqkdfMoBlPTNAdSfy6Zt3vwkTSk
X-Authority-Analysis: v=2.4 cv=Rdidyltv c=1 sm=1 tr=0 ts=6916d629 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=D-OMaI2VJto731AKaP4A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: _AhUiUqkdfMoBlPTNAdSfy6Zt3vwkTSk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA1NSBTYWx0ZWRfX9fCWxdYIE9tx
 11196J8STCa41MPGPUPRZeaqcfsS/RQm26tTqWzXQglk26GjdvDoVZf4GpDvlWV3S4CiN1NN4Ta
 jaAG2nFPyZhcgzXcNsJM6lBLwkXCni4p1g3sMjNdNBziKL0LklcvV5nlXVCHTJQnTqvAlb7x74L
 sfOtO6KeU0lT+VYsCm+6fBLMzBBPwlqdPqNU1yZFsPvLjvIW2WnFx9NKJDzl25FcsW96zrXUZS5
 PU1fTAwCy55MW8pAXiUCsmzrL4/ZxEHvTzWfl53H0FJgyd6gPcI2lhpoDAlaFxT6Vl/vjs8StQc
 u9re6t+0AJjS44cadA9x+nKWb9Nv7qMrCe/TLPyDS7lILpjE0nhWg5VswaGW8um9HpqslAhMQpK
 Y1gyu8har+CtrtF2BNHG3ttmA4CAdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140055

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


