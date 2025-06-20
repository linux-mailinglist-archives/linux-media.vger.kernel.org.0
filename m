Return-Path: <linux-media+bounces-35456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C0EAE1206
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 06:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D9D97A6D36
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 04:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7657F1F55F8;
	Fri, 20 Jun 2025 04:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZeC7uhsu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5B118024;
	Fri, 20 Jun 2025 04:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750392501; cv=none; b=NRz7UcoJgFrWzfmuKk5qwTcPdwFaU4LDARBeCSPJfh+UwK/mlnATijwGv85mNSW6HpxVPApSxg8BICm4MpbxF0hYvjiWQ7ceuoHQ8Ur3ihnNsFh5b+Y0tqC2FxABnRjb2tpbwzSp7urYGw+CtWaBBRqm18VXjQfQ42GOJirRX3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750392501; c=relaxed/simple;
	bh=BLXGm99TclJHEBbw17AvDP3TgZr6eGhpyM6kWdN4HVE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kFTRoWppD4XFRDBpnkYFGLO9SG14VgpNW4SOPRiS2fKVbhDFI1IBdrDm7VFdKYX4KNjdAQjEkGdVeGHmTt/hAn7W2ghXJHXJQUSW/c9h1QlKR/ZGJmcxbIexldj91X76fp4NcOxO+HLm5K/bbo0URqSDW/s96dH9iIpuqKnxfQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZeC7uhsu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JFvxrn027539;
	Fri, 20 Jun 2025 04:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uOkcPtorxcUikmHSKmsFfLtx18SQrz941gilrN/D4Fo=; b=ZeC7uhsuCotYpio9
	65cBsLxHvU6loIRFLix4EiO14k90FTHjcdQIDvG3aR8Zqo7yeAE2zZ3AuMk19hy5
	CYCjJVYknZ48KFj6ZgQFLc84jNIzNzuWmL4DTlJJc3ZWvUqqTCvBYJhSc+U5hjIS
	7QEk2HqR4WvAC/qplE4x8Efpr13+JT6VcPnTfexwhO2GbP3bdfGbuIbXZ74Sy/OU
	3eIbZ/GQStEQDwbDGXbc7FQd9hF0zf5m+CMpemQWhiFZNpUpCzV/wzPiZfK+TJBi
	L9Hn8bMrIrLU77ZcwtSsozXRkCHY8EGB0uAxOGPyJ/UDoJ5ILEzq4qmUa9piKoz1
	fLdHRw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hda29n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 04:08:16 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55K48FCb007343
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 04:08:15 GMT
Received: from cse-cd01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 19 Jun 2025 21:08:09 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <akapatra@quicinc.com>,
        <hariramp@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_svankada@quicinc.com>, <quic_depengs@quicinc.com>,
        <quic_vikramsa@quicinc.com>, <quic_wenmliu@quicinc.com>
Subject: [RFC PATCH 2/3] media: qcom: camss: csiphy: Add regulator current load setting
Date: Fri, 20 Jun 2025 12:07:35 +0800
Message-ID: <20250620040736.3032667-3-quic_wenmliu@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250620040736.3032667-1-quic_wenmliu@quicinc.com>
References: <20250620040736.3032667-1-quic_wenmliu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAyOSBTYWx0ZWRfX+7yOsX5GdUWR
 ObeUIA4/MwdZC36UvliEND7CNVhccV4ej9bZr20tk8D/JC0J3YIFUnifOz5A7vy+UwBBkH18EDR
 qAniC0rETe7Ob34Y8wIuj5k48Zu6kRXWqGi1eZ4ygg76FUzWispOsb0EwbHw9uu1bvKpzZNpioZ
 whgYSG29dVKo/G0wDfTIzVpNQNXw0FgRCwDOX6zQSsMx7OBSTfnLRddyibp6p/hU3PlNsLU0uF+
 nAQ5V3MSEQ16D3IAwYlOUYlvsy3zc5ClvQc/1jj2e73Rxb+LTzTJAWZu5E/1Zg/EuV+nTBjmfDc
 6A37zsCWkfJl/FPy6hDTBEUPCNjR5fxSkBIy5HXuXirrtLV7dGZ/ZKuZbe8LZQpkfHdZpcqBo6F
 vnZRCO2aGwR0YPeM3fUMYs1YBgYSlsUA4HvMKdmXF4ceD2NF52uNlTrNhztrESxRs3yoRdfm
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=6854deb0 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=bNxcAxEMKx_l-CPRCAQA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Dsj1NDvgPNbwfNzxfrxXePqi4maZ0Rih
X-Proofpoint-GUID: Dsj1NDvgPNbwfNzxfrxXePqi4maZ0Rih
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200029

Add support for current load in csiphy.

Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
---
 .../media/platform/qcom/camss/camss-csiphy.c  | 29 +++++++++++++++++++
 .../media/platform/qcom/camss/camss-csiphy.h  |  1 +
 2 files changed, 30 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index c622efcc92ff..c3069e8a6b62 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -209,6 +209,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
 {
 	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
 	struct device *dev = csiphy->camss->dev;
+	int i;
 
 	if (on) {
 		int ret;
@@ -217,6 +218,15 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
 		if (ret < 0)
 			return ret;
 
+		if (csiphy->load_currents) {
+			for (i = 0; i < csiphy->num_supplies; i++) {
+				ret = regulator_set_load(csiphy->supplies[i].consumer,
+							 csiphy->load_currents[i]);
+			if (ret)
+				return ret;
+			}
+		}
+
 		ret = regulator_bulk_enable(csiphy->num_supplies,
 					    csiphy->supplies);
 		if (ret < 0) {
@@ -250,6 +260,11 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
 
 		camss_disable_clocks(csiphy->nclocks, csiphy->clock);
 
+		if (csiphy->load_currents) {
+			for (i = 0; i < csiphy->num_supplies; i++)
+				regulator_set_load(csiphy->supplies[i].consumer, 0);
+		}
+
 		regulator_bulk_disable(csiphy->num_supplies, csiphy->supplies);
 
 		pm_runtime_put_sync(dev);
@@ -717,6 +732,20 @@ int msm_csiphy_subdev_init(struct camss *camss,
 
 	ret = devm_regulator_bulk_get(camss->dev, csiphy->num_supplies,
 				      csiphy->supplies);
+
+	if (device_property_present(camss->dev, "regulator-load-current")) {
+		csiphy->load_currents = kcalloc(csiphy->num_supplies, sizeof(u32), GFP_KERNEL);
+		if (!csiphy->load_currents)
+			return -ENOMEM;
+
+		ret = device_property_read_u32_array(camss->dev,
+						     "regulator-load-current",
+						     csiphy->load_currents,
+						     csiphy->num_supplies);
+		for (i = 0; i < csiphy->num_supplies; i++)
+			regulator_set_load(csiphy->supplies[i].consumer, 0);
+	}
+
 	return ret;
 }
 
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index ab91273303b9..74ebfc67a375 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -106,6 +106,7 @@ struct csiphy_device {
 	int nclocks;
 	u32 timer_clk_rate;
 	struct regulator_bulk_data *supplies;
+	u32 *load_currents;
 	int num_supplies;
 	struct csiphy_config cfg;
 	struct v4l2_mbus_framefmt fmt[MSM_CSIPHY_PADS_NUM];
-- 
2.34.1


