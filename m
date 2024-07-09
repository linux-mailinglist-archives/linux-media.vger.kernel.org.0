Return-Path: <linux-media+bounces-14783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EB092BF4B
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 18:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EACB4B27F77
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 16:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B05B1A38C1;
	Tue,  9 Jul 2024 16:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AEo7woCd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FB21A2FAB;
	Tue,  9 Jul 2024 16:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720541262; cv=none; b=KLmzE8RyCGq2Oj4ucEfTzMW4H8rX2fgUxjzekqFA56EYOqzIwWyPX9fQLtuQYrJFU70Yf7ukYVgnHBAUNGpWvvVNZs6OXNM2J+CdeULSWzR1VZlbini1JI2UMsjccDGsxCqC15eUDMh5cwvftWA2ud4omVN4L+iaYMM4stk+ePM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720541262; c=relaxed/simple;
	bh=bKk6blzkCL2N4vZDPeAtAyVe2f+oghUsLKhcGIo1CIg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IMNXHHfsYpLnKPMh9jBODCEc67vQupa8LvHQ5EHtf0QEjniTkf717s9NbPj4qrtbcJ5vSMlxowkIYksX1lhO7ijYrkwGOvsgZ7zNkYzqWWMC0k+qe+nO65u5HnSEHC0SuyF98MeelTDTTL5EnCkHeE9gSbjSIwZoienimOXnMz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AEo7woCd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469DkVIX010990;
	Tue, 9 Jul 2024 16:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fgXTkoWN8UbhnKCbTc5jTjVx
	fc2pAwQ4mQ/fwDeO5/0=; b=AEo7woCdqYDPD8OusFNN/4syXpyhZus46Xs7QVad
	haXCT7jNTTVuANz2SzxVsFsLQD9ZtpxdhV9TioH5du7jMZOUsGY1eEYkxZYyOcKj
	KCxtQtDGm9B6Jq0rV8dx6z7bXUHcoGuI0x/uDdphq+/O4SWYJev43b5CbdhcSG7z
	S7QNme7fVXsjigB5hTdBgffo1SdXlr9HduC5f2K6Vocbc5R+EGIImH3nPrZje6Ws
	FsJkMaoiU7K8deJ/Cssh8FkcD4tNKBpbYER/Mj3QjE7Sqs3maHBEaNdzCAnzc0NO
	dxgc6eULm4skc3AM/J6hgwzSzZVXuriVaSPWxxk4dQZxUQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406y3hep30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 16:07:36 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469G7ZHH032002
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 16:07:35 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 09:07:29 -0700
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH 05/13] media: qcom: camss: csiphy-3ph: Move CSIPHY variables to data field inside csiphy struct
Date: Tue, 9 Jul 2024 21:36:48 +0530
Message-ID: <20240709160656.31146-6-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240709160656.31146-1-quic_depengs@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VBNz-zwjjWq5I7sqKSsi0OXBV8I9UN_S
X-Proofpoint-GUID: VBNz-zwjjWq5I7sqKSsi0OXBV8I9UN_S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_05,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090106

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

A .data field in the csiphy device structure allows us to extend out the
register layout of the three phase capable CSIPHY layer.

Move the existing lane configuration structure to an encapsulating
structure -> struct csiphy_device_regs which is derived from the .data
field populated at PHY init time, as opposed to calculated at lane
configuration.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 55 ++++++++++++-------
 .../media/platform/qcom/camss/camss-csiphy.h  |  1 +
 2 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index b60c32a195df..93782ebfe0ea 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -63,6 +63,11 @@ struct csiphy_lane_regs {
 	u32 csiphy_param_type;
 };
 
+struct csiphy_device_regs {
+	const struct csiphy_lane_regs *lane_regs;
+	int lane_array_size;
+};
+
 /* GEN2 1.0 2PH */
 static const struct
 csiphy_lane_regs lane_regs_sdm845[] = {
@@ -470,28 +475,11 @@ static void csiphy_gen1_config_lanes(struct csiphy_device *csiphy,
 static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 				     u8 settle_cnt)
 {
-	const struct csiphy_lane_regs *r;
-	int i, array_size;
+	struct csiphy_device_regs *csiphy_regs = csiphy->data;
+	const struct csiphy_lane_regs *r = csiphy_regs->lane_regs;
+	int i, array_size = csiphy_regs->lane_array_size;
 	u32 val;
 
-	switch (csiphy->camss->res->version) {
-	case CAMSS_845:
-		r = &lane_regs_sdm845[0];
-		array_size = ARRAY_SIZE(lane_regs_sdm845);
-		break;
-	case CAMSS_8250:
-		r = &lane_regs_sm8250[0];
-		array_size = ARRAY_SIZE(lane_regs_sm8250);
-		break;
-	case CAMSS_8280XP:
-		r = &lane_regs_sc8280xp[0];
-		array_size = ARRAY_SIZE(lane_regs_sc8280xp);
-		break;
-	default:
-		WARN(1, "unknown cspi version\n");
-		return;
-	}
-
 	for (i = 0; i < array_size; i++, r++) {
 		switch (r->csiphy_param_type) {
 		case CSIPHY_SETTLE_CNT_LOWER_BYTE:
@@ -583,6 +571,33 @@ static void csiphy_lanes_disable(struct csiphy_device *csiphy,
 
 static int csiphy_init(struct csiphy_device *csiphy)
 {
+	struct device *dev = csiphy->camss->dev;
+	struct csiphy_device_regs *regs;
+
+	regs = devm_kmalloc(dev, sizeof(*regs), GFP_KERNEL);
+	if (!regs)
+		return -ENOMEM;
+
+	csiphy->data = regs;
+
+	switch (csiphy->camss->res->version) {
+	case CAMSS_845:
+		regs->lane_regs = &lane_regs_sdm845[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
+		break;
+	case CAMSS_8250:
+		regs->lane_regs = &lane_regs_sm8250[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
+		break;
+	case CAMSS_8280XP:
+		regs->lane_regs = &lane_regs_sc8280xp[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
+		break;
+	default:
+		WARN(1, "unknown csiphy version\n");
+		return -ENODEV;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index bdf9a9c8bacc..cac1f800b7d8 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -95,6 +95,7 @@ struct csiphy_device {
 	struct csiphy_config cfg;
 	struct v4l2_mbus_framefmt fmt[MSM_CSIPHY_PADS_NUM];
 	const struct csiphy_subdev_resources *res;
+	void *data;
 };
 
 struct camss_subdev_resources;
-- 
2.34.1


