Return-Path: <linux-media+bounces-24657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2857A0AE49
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 05:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B0803A2FD4
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 04:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C192B1C302E;
	Mon, 13 Jan 2025 04:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZiDn3TwS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17E61BBBE5;
	Mon, 13 Jan 2025 04:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736742758; cv=none; b=Ru/xT4iVkDsBPr8IvoMCxYejhxdkQpz2EdacWf2DflFueOXTcELA8YZDrflMP14QvaQPS6wkLo+gisQqG13rHfbioTVrP7o6UCW922PrMM3XDVTcikFLQvnntmFfykkzk8QsNM3vawK5kXbqdzK0KwjT01VmpLqEBHkFRNlituk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736742758; c=relaxed/simple;
	bh=mfjiBqvayHGaJhQRq422ijkuubHTvo1hciJj6hzaziU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MBgUSEhqNhn9jp9wSs2HMQCAQj1XgjDCxeNqLMYLHvq3GZLsil72VkBVXgyQSRztbC4ULPIKpkl0SO64XtYWycwWCLzr35gAezn17MwEC88Wdqcd806+Bscz8Rk6VvBApupoCE/q9pQBJjmoUzp8crVctIMxVRP1CggmZcef53E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZiDn3TwS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50CN0sxP012958;
	Mon, 13 Jan 2025 04:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/CpfSFGOyaUdmBsg/exlsrfV38k9kH6qTtFibtd2Nw8=; b=ZiDn3TwSZfuq/jKu
	UpsnHBMAQK65g1AagtCKrZz9KMU8TnZYMJGbvxXyKIZDv+pnbaaHi7Ruc7cTmxc8
	XbD03W9nBRbE0F05RfluYBIly5GeQfnnuytF6csmMlgc3yUfP/cDKGaSzHEzNuTx
	qT+ontG6wWlUcTDvt06hvN6XyXtDUgjCrizo1ko35DtWUSS5ACcxgifMTtv72ALH
	t553SkXBch2oshFRQRjEspRtkuDXuDhx9SOd77agd1ckUoDNtWswYe7nHFOS+Mh/
	WFRUcOC6tDK7Ysge14CvOlrSFdFX5g3085+0HXgSBtCXHd974p1hXDAE4I0OoEBo
	esSOnA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444g6n8yr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 04:32:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D4WVQP012759
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 04:32:32 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 12 Jan 2025 20:32:25 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>,
        <hverkuil@xs4all.nl>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v9 05/16] media: qcom: camss: csiphy-3ph: Move CSIPHY variables to data field inside csiphy struct
Date: Mon, 13 Jan 2025 10:01:22 +0530
Message-ID: <20250113043133.1387162-6-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113043133.1387162-1-quic_depengs@quicinc.com>
References: <20250113043133.1387162-1-quic_depengs@quicinc.com>
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
X-Proofpoint-ORIG-GUID: yjT9pM3QdySA50kGANvxixa4E0MoyI78
X-Proofpoint-GUID: yjT9pM3QdySA50kGANvxixa4E0MoyI78
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130036

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

A .data field in the csiphy device structure allows us to extend out the
register layout of the three phase capable CSIPHY layer.

Move the existing lane configuration structure to an encapsulating
structure -> struct csiphy_device_regs which is derived from the .data
field populated at PHY init time, as opposed to calculated at lane
configuration.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 54 ++++++++++---------
 .../media/platform/qcom/camss/camss-csiphy.h  |  6 +++
 2 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index b283df7634bb..39cc7109ccf0 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -470,32 +470,10 @@ static void csiphy_gen1_config_lanes(struct csiphy_device *csiphy,
 static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 				     u8 settle_cnt)
 {
-	const struct csiphy_lane_regs *r;
-	int i, array_size;
+	const struct csiphy_lane_regs *r = csiphy->regs->lane_regs;
+	int i, array_size = csiphy->regs->lane_array_size;
 	u32 val;
 
-	switch (csiphy->camss->res->version) {
-	case CAMSS_7280:
-		r = &lane_regs_sm8250[0];
-		array_size = ARRAY_SIZE(lane_regs_sm8250);
-		break;
-	case CAMSS_8250:
-		r = &lane_regs_sm8250[0];
-		array_size = ARRAY_SIZE(lane_regs_sm8250);
-		break;
-	case CAMSS_8280XP:
-		r = &lane_regs_sc8280xp[0];
-		array_size = ARRAY_SIZE(lane_regs_sc8280xp);
-		break;
-	case CAMSS_845:
-		r = &lane_regs_sdm845[0];
-		array_size = ARRAY_SIZE(lane_regs_sdm845);
-		break;
-	default:
-		WARN(1, "unknown cspi version\n");
-		return;
-	}
-
 	for (i = 0; i < array_size; i++, r++) {
 		switch (r->csiphy_param_type) {
 		case CSIPHY_SETTLE_CNT_LOWER_BYTE:
@@ -588,6 +566,34 @@ static void csiphy_lanes_disable(struct csiphy_device *csiphy,
 
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
+	case CAMSS_7280:
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
index 49393dfd5215..4d731597fed7 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -85,6 +85,11 @@ struct csiphy_subdev_resources {
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
@@ -103,6 +108,7 @@ struct csiphy_device {
 	struct csiphy_config cfg;
 	struct v4l2_mbus_framefmt fmt[MSM_CSIPHY_PADS_NUM];
 	const struct csiphy_subdev_resources *res;
+	struct csiphy_device_regs *regs;
 };
 
 struct camss_subdev_resources;
-- 
2.34.1


