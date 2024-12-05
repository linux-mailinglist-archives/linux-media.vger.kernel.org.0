Return-Path: <linux-media+bounces-22726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 759F89E5A5E
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 16:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CD7E188390C
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 15:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0CF21D58A;
	Thu,  5 Dec 2024 15:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JE1f5+pd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DEE222585;
	Thu,  5 Dec 2024 15:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733414189; cv=none; b=nNOensDyWqknGYCB25UX31yyFkTECKCnwFJhWF4h8pBtMEwnVuVPXgY+0P3On/3VWAeoip73HpqS74vfoBIi9zopMsxvEy0cXfPrSRRmEvHOBdgben22ruLVNPmEywfFybZkrQAym47Acb53FfEYisB9nl11qHQBxamjmYb2gm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733414189; c=relaxed/simple;
	bh=A4BTsPaGjDzcokbxbBZOusRIqet3nR5WsZuTuU9QGAQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LNqM6f84ldr7SzxCL/ofy7oabE3j6wNh0YFX7F3oZppHIhRxzbiq4EyETZMM39Q+YgFzaV/L1HgBu7TYJSd/gDH60IWB7/SgTVh056Wqllm6yvmmEOzfdT+om2Lb5SPRIgaLFbpPlwzBsyCuC2oyX5yojL8tJtQuCDrwqP9pxpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JE1f5+pd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B56mBw3005906;
	Thu, 5 Dec 2024 15:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fpqarxr4L5xwVorr7PTvZQh+SOnBfqYlcSRa+avx7gY=; b=JE1f5+pdLCqnpIEI
	G7zUVXUa6oglenVWKB/xYBqIE8jlasFfkJZO25Wc/fSH/65bySl01MgCj+9Cit27
	qFGpsfkLtAzehwGNZBmwves2BZN9xkUOsWXKhg0God0c4KGun2lBMJ61ASpyrExV
	0BNbUI8neFm+QZjJoqTPV1jPQoaaWGm3wTcifKAXQn0I8IETLuPz5HLGdivti5WE
	gT+3lZR9t60BrcQxoFQTE6pqewyHFmb6wxCOm0hxhALoe6tU4DbnBdSMzCnYR+1m
	JK8yUkYRxQ1WEgR1rgqZFS8B4QZRpSprSZiTygBoKKxKjrYvxzCx30p87Txnzny1
	xl/1iw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439w3er41g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 15:56:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5FuMP6020619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 15:56:22 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 07:56:16 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH 05/16] media: qcom: camss: csiphy-3ph: Move CSIPHY variables to data field inside csiphy struct
Date: Thu, 5 Dec 2024 21:25:27 +0530
Message-ID: <20241205155538.250743-6-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205155538.250743-1-quic_depengs@quicinc.com>
References: <20241205155538.250743-1-quic_depengs@quicinc.com>
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
X-Proofpoint-GUID: 3iNeGYLo_BpIUpCJ6wMe3WUrOuLQWJFz
X-Proofpoint-ORIG-GUID: 3iNeGYLo_BpIUpCJ6wMe3WUrOuLQWJFz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412050116

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

A .data field in the csiphy device structure allows us to extend out the
register layout of the three phase capable CSIPHY layer.

Move the existing lane configuration structure to an encapsulating
structure -> struct csiphy_device_regs which is derived from the .data
field populated at PHY init time, as opposed to calculated at lane
configuration.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 49 +++++++++++--------
 .../media/platform/qcom/camss/camss-csiphy.h  |  6 +++
 2 files changed, 35 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index b60c32a195df..2b8ff7fd1dd9 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -470,28 +470,10 @@ static void csiphy_gen1_config_lanes(struct csiphy_device *csiphy,
 static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 				     u8 settle_cnt)
 {
-	const struct csiphy_lane_regs *r;
-	int i, array_size;
+	const struct csiphy_lane_regs *r = csiphy->regs->lane_regs;
+	int i, array_size = csiphy->regs->lane_array_size;
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
@@ -583,6 +565,33 @@ static void csiphy_lanes_disable(struct csiphy_device *csiphy,
 
 static int csiphy_init(struct csiphy_device *csiphy)
 {
+	struct device *dev = csiphy->camss->dev;
+	struct csiphy_device_regs *regs;
+
+	regs = devm_kmalloc(dev, sizeof(*regs), GFP_KERNEL);
+	if (!regs)
+		return -ENOMEM;
+
+	csiphy->regs = regs;
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
index a77bccacb37f..2371507b0a1f 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -79,6 +79,11 @@ struct csiphy_subdev_resources {
 	const struct csiphy_formats *formats;
 };
 
+struct csiphy_device_regs {
+	const struct csiphy_lane_regs *lane_regs;
+	int lane_array_size;
+};
+
 struct csiphy_device {
 	struct camss *camss;
 	u8 id;
@@ -97,6 +102,7 @@ struct csiphy_device {
 	struct csiphy_config cfg;
 	struct v4l2_mbus_framefmt fmt[MSM_CSIPHY_PADS_NUM];
 	const struct csiphy_subdev_resources *res;
+	struct csiphy_device_regs *regs;
 };
 
 struct camss_subdev_resources;
-- 
2.34.1


