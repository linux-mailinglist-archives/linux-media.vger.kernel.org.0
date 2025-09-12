Return-Path: <linux-media+bounces-42413-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA51B549FB
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 12:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62B7AAA596C
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 10:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863B219992C;
	Fri, 12 Sep 2025 10:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDtMxzez"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A933C2EB5B0
	for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 10:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673417; cv=none; b=iFVqNyzQIC+kTt12IOo9aDjSL1soLdyKkUqFYcfhQNvpFx4pp0wLBpFPxSET2MNbRXrmA/stPqwO0a2DtJkkGXKSLHrPvmFZVms9s8aPcGY4E91JouZzvfwEav95SLDuF9ukWkTnYyL2EyXEL6s6xxuku2hXMiJ+3+sGjFTwtro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673417; c=relaxed/simple;
	bh=7jxWqacBZ6AAuPHsfSDGdY3Qm64387CVaLCv9LSLkiY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m29q5hOJswvZSYV/tjI+9QJtO4iE2B1UKN8a3nhInInu5O2gSJy8oCrwcVy8TwVr55Soz9S95P1ucZkoA3vJATHTtMF7gUegpuacpRLq3435yQttM/nC7PBmE+0N7BbGpQ8fNgtKoBCMJnLTmveFT/mPq6ruEPYAuKiVWCYw9J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDtMxzez; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fNl0023232
	for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 10:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uOjR35eLHkEN3KiQ06akGbY/xV3LkM6yhTd
	OwIGj+uU=; b=EDtMxzez6HJxbnBolPqcM5OiAmg4mjUizheIaUI7lRMoeuzPH6V
	NC7U8tTlx9qNG6jCNVrJBuijbUBSX8gTcwZwZCd7u9yQDSo8mluf0NSG5bgINdjL
	FgDR217uusgVg0mtBI9Kr5wwTWvf2RHaGj0zZOzWcinUN+tj8hZdjs6vmRldKT6A
	OnfToVYTsmzgB4MrvdUbSqOCAlUL5S9qZ/wDhnAIkj9+EQl7q4Jbt4zuMrAB0Gui
	hGuDTc806Y1x1eqpLnwKjsA6CuAFDMHvuUa3cqG+rjMnKVymp1F+WPeY3UBhBb47
	/G0dMd+o07qDaJg71VOLKEkwkLbQFKv4J+g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2f9c8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 10:36:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7585b6deccaso31387146d6.0
        for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 03:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757673411; x=1758278211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOjR35eLHkEN3KiQ06akGbY/xV3LkM6yhTdOwIGj+uU=;
        b=PvaX1M61m0/BuUk9zwGWbeDM2JfT6kkDyWa31WmQGsqyW5QQC7X6fese2Rm7t1KUDI
         5WR1Y98aqeBFeIpzfYGIidvjCAUijWvBXq1x104IbLwRKh5BLDiOJ4uFeTtxuOE8tJci
         Rp+nY74aQHrIq6oocMOznVD9V6Ig94QgFiD8tRlSPQuoLM3FcoFxQyRB3oKZe7bIHHzb
         V/8tTK+34hD/b+cXqnEfoEGuxE3KB2ap1WUfZejMf404h3jEKet7R4TdwiFyP06H1uER
         u4TUaZyhy4gLm9jeUiq1eFoHXoMpIQBBJPIfL8Qn0OCqVhq1BH7a54voK45NS8GKmwXk
         QacQ==
X-Gm-Message-State: AOJu0YyiPY8BtMDkzADrGPk0jaGszGpxQBtCmyAmb4mqCPu0DzgluABu
	vLu5Q+495sLmtiLm1ZuUZn0YZlUwg5YZJin2uqyINfpGb6h/hfaw9sS16YbIl/LpzNY8g/QM+zg
	HVkPy4VE66pTgxvY11bdTyNaoG3KozqKppT6a7NcB58ilTLrXSQpl4TJPQpOgO93DA/rNiV4rvy
	XW4k4=
X-Gm-Gg: ASbGncvRTYGUIW4f6yVHgjDrkLfclZufYX9dBLOBCq06skzquscvXQU5I/oWG2VCpa9
	XjETYDy2By3RmHwgnOKjtlSE9+nek5aeF5Dh7lVXyGRpUXINP7oKNPxdFLCv+9fYCgPmjbSv8Z6
	UO4PgiQ8LJbn1Ti+PqcAX/Y0UkenTVPReO+OD+GP9oh5mtMRpvUgxxgp8U0sDVdbYaK6nXhtfAn
	9DcaR101Cd4rNRJWuhsrZ0waRxqsliY24WbnKjwgtUR+wIiM/7imRYIH0G6FOUEITGxBeEU02CD
	Quxd9THonzM71O8WfMq3W0OpS9r1Rx1UqW+JWr0e8Rtzndr11bqmhbfi1vPfzl7y63g64Rxp/AG
	9yoAgOTs7UeOKwt2KVSfp6mZerl4=
X-Received: by 2002:a05:6214:2a88:b0:742:e50f:22a4 with SMTP id 6a1803df08f44-767be102dacmr32063726d6.27.1757673410873;
        Fri, 12 Sep 2025 03:36:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlSis7zZ/dAB4816mlxmTTZAYMl/jbWGbbKXmhIZtTNzjXW2f5KP4XygRK1m8mgtb3cgJBYg==
X-Received: by 2002:a05:6214:2a88:b0:742:e50f:22a4 with SMTP id 6a1803df08f44-767be102dacmr32063206d6.27.1757673410077;
        Fri, 12 Sep 2025 03:36:50 -0700 (PDT)
Received: from WENMLIU-LAB01.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-763bdd36447sm25174956d6.46.2025.09.12.03.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:36:49 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
To: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v3] media: qcom: camss: Add support for regulator init_load_uA in CSIPHY
Date: Fri, 12 Sep 2025 18:36:31 +0800
Message-Id: <20250912103631.1184-1-wenmeng.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c3f7c5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=-9CAIrFtjw9YHLUclIIA:9 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bwZ1yMffo4qbPFLEal_KeNaKXuXJ13jC
X-Proofpoint-GUID: bwZ1yMffo4qbPFLEal_KeNaKXuXJ13jC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX5dJmAFoKgK1B
 Mx8tDXFQlwnNLskzsw1LP9k2H/JAwv2OkzFvVBdge+0eLbgh1RI1Y6lEqgwACKaIUvlsHsTnCdW
 S6O+au9hpBE4Hl9uYUHIfAoRcfppTud5w1q8OVcNec9+8Ko8E+yHCDw3NP+cn1MMkuD6flpAbOw
 oNlLxHbftIUprVAKmSg8MSu0Ff9cV3EgKFs+Y7pTeSrZdUYHzsY3q9ZHi6tXweN9yxAKjXCJcxM
 MY4qLZtuoIrw4GyyniaAgemiCKGmHnhfV4mTLYqcUg27UztjEcVl0v/Q2X2aFwg24JIKHGqy4H4
 UeJy0S1jybFXAFh5kWSUCpSABO59eOW7pi6B5X3SSbSHSGfA3p4hCESCh5617mkFwqB5hF+4PIX
 m8wR6FYq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1011 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

Some Qualcomm regulators are configured with initial mode as
HPM (High Power Mode), which may lead to higher power consumption.
To reduce power usage, it's preferable to set the initial mode
to LPM (Low Power Mode).

To ensure the regulator can switch from LPM to HPM when needed,
this patch adds current load configuration for CAMSS CSIPHY.
This allows the regulator framework to scale the mode dynamically
based on the load requirement.

The current default value for current is uninitialized or random.
To address this, initial current values are added for the
following platforms:
MSM8916, MSM8953, MSM8996, QCM2290, SDM670, SM8250, SC7280, SM8550
QCS8300, SA8775P and X1E80100.

For SDM660, SDM845, SC8280XP the value is set to 0,
indicating that no default current value is configured,
the other values are derived from the power grid.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

---
Changes in v3:
- Use devm_regulator_bulk_get_const instead of devm_regulator_bulk_get.
- Set the default current value to 0.
- Refactor the code to minimize data copying, and support more platform-specific values.
- Link to v2: https://lore.kernel.org/all/20250729-camss_csiphy_current-v2-1-da3c72a2055c@quicinc.com/

Changes in v2:
- Change the source of the current value from DTS to CAMSS resource
- Link to v1: https://lore.kernel.org/all/20250620040736.3032667-1-quic_wenmliu@quicinc.com/
---
 .../media/platform/qcom/camss/camss-csid.c    |  18 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |  19 +-
 drivers/media/platform/qcom/camss/camss.c     | 290 ++++++++++++++----
 drivers/media/platform/qcom/camss/camss.h     |   2 +-
 4 files changed, 235 insertions(+), 94 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 5284b5857368..ed1820488c98 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1187,24 +1187,12 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 
 	/* Regulator */
 	for (i = 0; i < ARRAY_SIZE(res->regulators); i++) {
-		if (res->regulators[i])
+		if (res->regulators[i].supply)
 			csid->num_supplies++;
 	}
 
-	if (csid->num_supplies) {
-		csid->supplies = devm_kmalloc_array(camss->dev,
-						    csid->num_supplies,
-						    sizeof(*csid->supplies),
-						    GFP_KERNEL);
-		if (!csid->supplies)
-			return -ENOMEM;
-	}
-
-	for (i = 0; i < csid->num_supplies; i++)
-		csid->supplies[i].supply = res->regulators[i];
-
-	ret = devm_regulator_bulk_get(camss->dev, csid->num_supplies,
-				      csid->supplies);
+	ret = devm_regulator_bulk_get_const(camss->dev, csid->num_supplies,
+					    res->regulators, &csid->supplies);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 2de97f58f9ae..390427c163de 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -694,24 +694,13 @@ int msm_csiphy_subdev_init(struct camss *camss,
 
 	/* CSIPHY supplies */
 	for (i = 0; i < ARRAY_SIZE(res->regulators); i++) {
-		if (res->regulators[i])
+		if (res->regulators[i].supply)
 			csiphy->num_supplies++;
 	}
 
-	if (csiphy->num_supplies) {
-		csiphy->supplies = devm_kmalloc_array(camss->dev,
-						      csiphy->num_supplies,
-						      sizeof(*csiphy->supplies),
-						      GFP_KERNEL);
-		if (!csiphy->supplies)
-			return -ENOMEM;
-	}
-
-	for (i = 0; i < csiphy->num_supplies; i++)
-		csiphy->supplies[i].supply = res->regulators[i];
-
-	ret = devm_regulator_bulk_get(camss->dev, csiphy->num_supplies,
-				      csiphy->supplies);
+	if (csiphy->num_supplies > 0)
+		ret = devm_regulator_bulk_get_const(camss->dev, csiphy->num_supplies,
+						    res->regulators, &csiphy->supplies);
 	return ret;
 }
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2fbcd0e343aa..43e4bc5a91be 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -73,7 +73,9 @@ static const struct camss_subdev_resources csiphy_res_8x16[] = {
 static const struct camss_subdev_resources csid_res_8x16[] = {
 	/* CSID0 */
 	{
-		.regulators = { "vdda" },
+		.regulators = {
+			{ .supply = "vdda", .init_load_uA = 40000 }
+		},
 		.clock = { "top_ahb", "ispif_ahb", "csi0_ahb", "ahb",
 			   "csi0", "csi0_phy", "csi0_pix", "csi0_rdi" },
 		.clock_rate = { { 0 },
@@ -95,7 +97,9 @@ static const struct camss_subdev_resources csid_res_8x16[] = {
 
 	/* CSID1 */
 	{
-		.regulators = { "vdda" },
+		.regulators = {
+			{ .supply = "vdda", .init_load_uA = 40000 }
+		},
 		.clock = { "top_ahb", "ispif_ahb", "csi1_ahb", "ahb",
 			   "csi1", "csi1_phy", "csi1_pix", "csi1_rdi" },
 		.clock_rate = { { 0 },
@@ -157,7 +161,9 @@ static const struct camss_subdev_resources vfe_res_8x16[] = {
 static const struct camss_subdev_resources csid_res_8x53[] = {
 	/* CSID0 */
 	{
-		.regulators = { "vdda" },
+		.regulators = {
+			{ .supply = "vdda", .init_load_uA = 9900 }
+		},
 		.clock = { "top_ahb", "ispif_ahb", "csi0_ahb", "ahb",
 			   "csi0", "csi0_phy", "csi0_pix", "csi0_rdi" },
 		.clock_rate = { { 0 },
@@ -180,7 +186,9 @@ static const struct camss_subdev_resources csid_res_8x53[] = {
 
 	/* CSID1 */
 	{
-		.regulators = { "vdda" },
+		.regulators = {
+			{ .supply = "vdda", .init_load_uA = 9900 }
+		},
 		.clock = { "top_ahb", "ispif_ahb", "csi1_ahb", "ahb",
 			   "csi1", "csi1_phy", "csi1_pix", "csi1_rdi" },
 		.clock_rate = { { 0 },
@@ -203,7 +211,9 @@ static const struct camss_subdev_resources csid_res_8x53[] = {
 
 	/* CSID2 */
 	{
-		.regulators = { "vdda" },
+		.regulators = {
+			{ .supply = "vdda", .init_load_uA = 9900 }
+		},
 		.clock = { "top_ahb", "ispif_ahb", "csi2_ahb", "ahb",
 			   "csi2", "csi2_phy", "csi2_pix", "csi2_rdi" },
 		.clock_rate = { { 0 },
@@ -364,7 +374,9 @@ static const struct camss_subdev_resources csiphy_res_8x96[] = {
 static const struct camss_subdev_resources csid_res_8x96[] = {
 	/* CSID0 */
 	{
-		.regulators = { "vdda" },
+		.regulators = {
+			{ .supply = "vdda", .init_load_uA = 80160 }
+		},
 		.clock = { "top_ahb", "ispif_ahb", "csi0_ahb", "ahb",
 			   "csi0", "csi0_phy", "csi0_pix", "csi0_rdi" },
 		.clock_rate = { { 0 },
@@ -386,7 +398,9 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
 
 	/* CSID1 */
 	{
-		.regulators = { "vdda" },
+		.regulators = {
+			{ .supply = "vdda", .init_load_uA = 80160 }
+		},
 		.clock = { "top_ahb", "ispif_ahb", "csi1_ahb", "ahb",
 			   "csi1", "csi1_phy", "csi1_pix", "csi1_rdi" },
 		.clock_rate = { { 0 },
@@ -408,7 +422,9 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
 
 	/* CSID2 */
 	{
-		.regulators = { "vdda" },
+		.regulators = {
+			{ .supply = "vdda", .init_load_uA = 80160 }
+		},
 		.clock = { "top_ahb", "ispif_ahb", "csi2_ahb", "ahb",
 			   "csi2", "csi2_phy", "csi2_pix", "csi2_rdi" },
 		.clock_rate = { { 0 },
@@ -430,7 +446,9 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
 
 	/* CSID3 */
 	{
-		.regulators = { "vdda" },
+		.regulators = {
+			{ .supply = "vdda", .init_load_uA = 80160 }
+		},
 		.clock = { "top_ahb", "ispif_ahb", "csi3_ahb", "ahb",
 			   "csi3", "csi3_phy", "csi3_pix", "csi3_rdi" },
 		.clock_rate = { { 0 },
@@ -518,7 +536,10 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
 static const struct camss_subdev_resources csiphy_res_2290[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
+		.regulators = {
+			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 26700 },
+			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 2600 }
+		},
 		.clock = { "top_ahb", "ahb", "csiphy0", "csiphy0_timer" },
 		.clock_rate = { { 0 },
 				{ 0 },
@@ -535,7 +556,10 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
 
 	/* CSIPHY1 */
 	{
-		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
+		.regulators = {
+			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 26700 },
+			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 2600 }
+		},
 		.clock = { "top_ahb", "ahb", "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 0 },
 				{ 0 },
@@ -711,7 +735,10 @@ static const struct camss_subdev_resources csiphy_res_660[] = {
 static const struct camss_subdev_resources csid_res_660[] = {
 	/* CSID0 */
 	{
-		.regulators = { "vdda", "vdd_sec" },
+		.regulators = {
+			{ .supply = "vdda", .init_load_uA = 0 },
+			{ .supply = "vdd_sec", .init_load_uA = 0 }
+		},
 		.clock = { "top_ahb", "ispif_ahb", "csi0_ahb", "ahb",
 			   "csi0", "csi0_phy", "csi0_pix", "csi0_rdi",
 			   "cphy_csid0" },
@@ -736,7 +763,10 @@ static const struct camss_subdev_resources csid_res_660[] = {
 
 	/* CSID1 */
 	{
-		.regulators = { "vdda", "vdd_sec" },
+		.regulators = {
+			{ .supply = "vdda", .init_load_uA = 0 },
+			{ .supply = "vdd_sec", .init_load_uA = 0 }
+		},
 		.clock = { "top_ahb", "ispif_ahb", "csi1_ahb", "ahb",
 			   "csi1", "csi1_phy", "csi1_pix", "csi1_rdi",
 			   "cphy_csid1" },
@@ -761,7 +791,10 @@ static const struct camss_subdev_resources csid_res_660[] = {
 
 	/* CSID2 */
 	{
-		.regulators = { "vdda", "vdd_sec" },
+		.regulators = {
+			{ .supply = "vdda", .init_load_uA = 0 },
+			{ .supply = "vdd_sec", .init_load_uA = 0 }
+		},
 		.clock = { "top_ahb", "ispif_ahb", "csi2_ahb", "ahb",
 			   "csi2", "csi2_phy", "csi2_pix", "csi2_rdi",
 			   "cphy_csid2" },
@@ -786,7 +819,10 @@ static const struct camss_subdev_resources csid_res_660[] = {
 
 	/* CSID3 */
 	{
-		.regulators = { "vdda", "vdd_sec" },
+		.regulators = {
+			{ .supply = "vdda", .init_load_uA = 0 },
+			{ .supply = "vdd_sec", .init_load_uA = 0 }
+		},
 		.clock = { "top_ahb", "ispif_ahb", "csi3_ahb", "ahb",
 			   "csi3", "csi3_phy", "csi3_pix", "csi3_rdi",
 			   "cphy_csid3" },
@@ -883,7 +919,10 @@ static const struct camss_subdev_resources vfe_res_660[] = {
 static const struct camss_subdev_resources csiphy_res_670[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 42800 },
+			{ .supply = "vdda-pll", .init_load_uA = 13900 }
+		},
 		.clock = { "soc_ahb", "cpas_ahb",
 			   "csiphy0", "csiphy0_timer" },
 		.clock_rate = { { 0 },
@@ -901,7 +940,10 @@ static const struct camss_subdev_resources csiphy_res_670[] = {
 
 	/* CSIPHY1 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 42800 },
+			{ .supply = "vdda-pll", .init_load_uA = 13900 }
+		},
 		.clock = { "soc_ahb", "cpas_ahb",
 			   "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 0 },
@@ -919,7 +961,10 @@ static const struct camss_subdev_resources csiphy_res_670[] = {
 
 	/* CSIPHY2 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 42800 },
+			{ .supply = "vdda-pll", .init_load_uA = 13900 }
+		},
 		.clock = { "soc_ahb", "cpas_ahb",
 			   "csiphy2", "csiphy2_timer" },
 		.clock_rate = { { 0 },
@@ -1159,7 +1204,10 @@ static const struct camss_subdev_resources csiphy_res_845[] = {
 static const struct camss_subdev_resources csid_res_845[] = {
 	/* CSID0 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 0 },
+			{ .supply = "vdda-pll", .init_load_uA = 0 }
+		},
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe0", "vfe0_src",
 				"vfe0_cphy_rx", "csi0",
@@ -1184,7 +1232,10 @@ static const struct camss_subdev_resources csid_res_845[] = {
 
 	/* CSID1 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 0 },
+			{ .supply = "vdda-pll", .init_load_uA = 0 }
+		},
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe1", "vfe1_src",
 				"vfe1_cphy_rx", "csi1",
@@ -1209,7 +1260,10 @@ static const struct camss_subdev_resources csid_res_845[] = {
 
 	/* CSID2 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 0 },
+			{ .supply = "vdda-pll", .init_load_uA = 0 }
+		},
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe_lite", "vfe_lite_src",
 				"vfe_lite_cphy_rx", "csi2",
@@ -1321,7 +1375,10 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 static const struct camss_subdev_resources csiphy_res_8250[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 17500 },
+			{ .supply = "vdda-pll", .init_load_uA = 10000 }
+		},
 		.clock = { "csiphy0", "csiphy0_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -1335,7 +1392,10 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 	},
 	/* CSIPHY1 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 17500 },
+			{ .supply = "vdda-pll", .init_load_uA = 10000 }
+		},
 		.clock = { "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -1349,7 +1409,10 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 	},
 	/* CSIPHY2 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 17500 },
+			{ .supply = "vdda-pll", .init_load_uA = 10000 }
+		},
 		.clock = { "csiphy2", "csiphy2_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -1363,7 +1426,10 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 	},
 	/* CSIPHY3 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 17500 },
+			{ .supply = "vdda-pll", .init_load_uA = 10000 }
+		},
 		.clock = { "csiphy3", "csiphy3_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -1377,7 +1443,10 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 	},
 	/* CSIPHY4 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 17500 },
+			{ .supply = "vdda-pll", .init_load_uA = 10000 }
+		},
 		.clock = { "csiphy4", "csiphy4_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -1391,7 +1460,10 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 	},
 	/* CSIPHY5 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 17500 },
+			{ .supply = "vdda-pll", .init_load_uA = 10000 }
+		},
 		.clock = { "csiphy5", "csiphy5_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -1605,7 +1677,10 @@ static const struct resources_icc icc_res_sm8250[] = {
 static const struct camss_subdev_resources csiphy_res_7280[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 16100 },
+			{ .supply = "vdda-pll", .init_load_uA = 9000 }
+		},
 
 		.clock = { "csiphy0", "csiphy0_timer" },
 		.clock_rate = { { 300000000, 400000000 },
@@ -1620,7 +1695,10 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 	},
 	/* CSIPHY1 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 16100 },
+			{ .supply = "vdda-pll", .init_load_uA = 9000 }
+		},
 
 		.clock = { "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 300000000, 400000000 },
@@ -1635,7 +1713,10 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 	},
 	/* CSIPHY2 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 16100 },
+			{ .supply = "vdda-pll", .init_load_uA = 9000 }
+		},
 
 		.clock = { "csiphy2", "csiphy2_timer" },
 		.clock_rate = { { 300000000, 400000000 },
@@ -1650,7 +1731,10 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 	},
 	/* CSIPHY3 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 16100 },
+			{ .supply = "vdda-pll", .init_load_uA = 9000 }
+		},
 
 		.clock = { "csiphy3", "csiphy3_timer" },
 		.clock_rate = { { 300000000, 400000000 },
@@ -1665,7 +1749,10 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 	},
 	/* CSIPHY4 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 16100 },
+			{ .supply = "vdda-pll", .init_load_uA = 9000 }
+		},
 
 		.clock = { "csiphy4", "csiphy4_timer" },
 		.clock_rate = { { 300000000, 400000000 },
@@ -1978,7 +2065,10 @@ static const struct camss_subdev_resources csiphy_res_sc8280xp[] = {
 static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 	/* CSID0 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 0 },
+			{ .supply = "vdda-pll", .init_load_uA = 0 }
+		},
 		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_axi" },
 		.clock_rate = { { 400000000, 480000000, 600000000 },
 				{ 0 },
@@ -1994,7 +2084,10 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 	},
 	/* CSID1 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 0 },
+			{ .supply = "vdda-pll", .init_load_uA = 0 }
+		},
 		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_axi" },
 		.clock_rate = { { 400000000, 480000000, 600000000 },
 				{ 0 },
@@ -2010,7 +2103,10 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 	},
 	/* CSID2 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 0 },
+			{ .supply = "vdda-pll", .init_load_uA = 0 }
+		},
 		.clock = { "vfe2_csid", "vfe2_cphy_rx", "vfe2", "vfe2_axi" },
 		.clock_rate = { { 400000000, 480000000, 600000000 },
 				{ 0 },
@@ -2026,7 +2122,10 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 	},
 	/* CSID3 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 0 },
+			{ .supply = "vdda-pll", .init_load_uA = 0 }
+		},
 		.clock = { "vfe3_csid", "vfe3_cphy_rx", "vfe3", "vfe3_axi" },
 		.clock_rate = { { 400000000, 480000000, 600000000 },
 				{ 0 },
@@ -2042,7 +2141,10 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 	},
 	/* CSID_LITE0 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 0 },
+			{ .supply = "vdda-pll", .init_load_uA = 0 }
+		},
 		.clock = { "vfe_lite0_csid", "vfe_lite0_cphy_rx", "vfe_lite0" },
 		.clock_rate = { { 400000000, 480000000, 600000000 },
 				{ 0 },
@@ -2058,7 +2160,10 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 	},
 	/* CSID_LITE1 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 0 },
+			{ .supply = "vdda-pll", .init_load_uA = 0 }
+		},
 		.clock = { "vfe_lite1_csid", "vfe_lite1_cphy_rx", "vfe_lite1" },
 		.clock_rate = { { 400000000, 480000000, 600000000 },
 				{ 0 },
@@ -2074,7 +2179,10 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 	},
 	/* CSID_LITE2 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 0 },
+			{ .supply = "vdda-pll", .init_load_uA = 0 }
+		},
 		.clock = { "vfe_lite2_csid", "vfe_lite2_cphy_rx", "vfe_lite2" },
 		.clock_rate = { { 400000000, 480000000, 600000000 },
 				{ 0 },
@@ -2090,7 +2198,10 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 	},
 	/* CSID_LITE3 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 0 },
+			{ .supply = "vdda-pll", .init_load_uA = 0 }
+		},
 		.clock = { "vfe_lite3_csid", "vfe_lite3_cphy_rx", "vfe_lite3" },
 		.clock_rate = { { 400000000, 480000000, 600000000 },
 				{ 0 },
@@ -2291,7 +2402,10 @@ static const struct resources_icc icc_res_sc8280xp[] = {
 static const struct camss_subdev_resources csiphy_res_8550[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 32200 },
+			{ .supply = "vdda-pll", .init_load_uA = 18000 }
+		},
 		.clock = { "csiphy0", "csiphy0_timer" },
 		.clock_rate = { { 400000000, 480000000 },
 				{ 400000000 } },
@@ -2305,7 +2419,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 	},
 	/* CSIPHY1 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 32200 },
+			{ .supply = "vdda-pll", .init_load_uA = 18000 }
+		},
 		.clock = { "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 400000000, 480000000 },
 				{ 400000000 } },
@@ -2319,7 +2436,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 	},
 	/* CSIPHY2 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 32200 },
+			{ .supply = "vdda-pll", .init_load_uA = 18000 }
+		},
 		.clock = { "csiphy2", "csiphy2_timer" },
 		.clock_rate = { { 400000000, 480000000 },
 				{ 400000000 } },
@@ -2333,7 +2453,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 	},
 	/* CSIPHY3 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 32200 },
+			{ .supply = "vdda-pll", .init_load_uA = 18000 }
+		},
 		.clock = { "csiphy3", "csiphy3_timer" },
 		.clock_rate = { { 400000000, 480000000 },
 				{ 400000000 } },
@@ -2347,7 +2470,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 	},
 	/* CSIPHY4 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 37900 },
+			{ .supply = "vdda-pll", .init_load_uA = 18600 }
+		},
 		.clock = { "csiphy4", "csiphy4_timer" },
 		.clock_rate = { { 400000000, 480000000 },
 				{ 400000000 } },
@@ -2361,7 +2487,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 	},
 	/* CSIPHY5 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 32200 },
+			{ .supply = "vdda-pll", .init_load_uA = 18000 }
+		},
 		.clock = { "csiphy5", "csiphy5_timer" },
 		.clock_rate = { { 400000000, 480000000 },
 				{ 400000000 } },
@@ -2375,7 +2504,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 	},
 	/* CSIPHY6 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 37900 },
+			{ .supply = "vdda-pll", .init_load_uA = 18600 }
+		},
 		.clock = { "csiphy6", "csiphy6_timer" },
 		.clock_rate = { { 400000000, 480000000 },
 				{ 400000000 } },
@@ -2389,7 +2521,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 	},
 	/* CSIPHY7 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 32200 },
+			{ .supply = "vdda-pll", .init_load_uA = 18000 }
+		},
 		.clock = { "csiphy7", "csiphy7_timer" },
 		.clock_rate = { { 400000000, 480000000 },
 				{ 400000000 } },
@@ -2620,7 +2755,10 @@ static const struct resources_icc icc_res_sm8550[] = {
 static const struct camss_subdev_resources csiphy_res_8300[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 15900 },
+			{ .supply = "vdda-pll", .init_load_uA = 8900 }
+		},
 
 		.clock = { "csiphy_rx", "csiphy0", "csiphy0_timer" },
 		.clock_rate = {
@@ -2638,7 +2776,10 @@ static const struct camss_subdev_resources csiphy_res_8300[] = {
 	},
 	/* CSIPHY1 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 15900 },
+			{ .supply = "vdda-pll", .init_load_uA = 8900 }
+		},
 
 		.clock = { "csiphy_rx", "csiphy1", "csiphy1_timer" },
 		.clock_rate = {
@@ -2656,7 +2797,10 @@ static const struct camss_subdev_resources csiphy_res_8300[] = {
 	},
 	/* CSIPHY2 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 15900 },
+			{ .supply = "vdda-pll", .init_load_uA = 8900 }
+		},
 
 		.clock = { "csiphy_rx", "csiphy2", "csiphy2_timer" },
 		.clock_rate = {
@@ -2677,7 +2821,10 @@ static const struct camss_subdev_resources csiphy_res_8300[] = {
 static const struct camss_subdev_resources csiphy_res_8775p[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 15900 },
+			{ .supply = "vdda-pll", .init_load_uA = 8900 }
+		},
 		.clock = { "csiphy_rx", "csiphy0", "csiphy0_timer"},
 		.clock_rate = {
 			{ 400000000 },
@@ -2694,7 +2841,10 @@ static const struct camss_subdev_resources csiphy_res_8775p[] = {
 	},
 	/* CSIPHY1 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 15900 },
+			{ .supply = "vdda-pll", .init_load_uA = 8900 }
+		},
 		.clock = { "csiphy_rx", "csiphy1", "csiphy1_timer"},
 		.clock_rate = {
 			{ 400000000 },
@@ -2711,7 +2861,10 @@ static const struct camss_subdev_resources csiphy_res_8775p[] = {
 	},
 	/* CSIPHY2 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 15900 },
+			{ .supply = "vdda-pll", .init_load_uA = 8900 }
+		},
 		.clock = { "csiphy_rx", "csiphy2", "csiphy2_timer"},
 		.clock_rate = {
 			{ 400000000 },
@@ -2728,7 +2881,10 @@ static const struct camss_subdev_resources csiphy_res_8775p[] = {
 	},
 	/* CSIPHY3 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 15900 },
+			{ .supply = "vdda-pll", .init_load_uA = 8900 }
+		},
 		.clock = { "csiphy_rx", "csiphy3", "csiphy3_timer"},
 		.clock_rate = {
 			{ 400000000 },
@@ -3081,8 +3237,10 @@ static const struct resources_icc icc_res_sa8775p[] = {
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = { "vdd-csiphy-0p8",
-				"vdd-csiphy-1p2" },
+		.regulators = {
+			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
+			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
+		},
 		.clock = { "csiphy0", "csiphy0_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
@@ -3096,8 +3254,10 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY1 */
 	{
-		.regulators = { "vdd-csiphy-0p8",
-				"vdd-csiphy-1p2" },
+		.regulators = {
+			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
+			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
+		},
 		.clock = { "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
@@ -3111,8 +3271,10 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY2 */
 	{
-		.regulators = { "vdd-csiphy-0p8",
-				"vdd-csiphy-1p2" },
+		.regulators = {
+			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
+			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
+		},
 		.clock = { "csiphy2", "csiphy2_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
@@ -3126,8 +3288,10 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY4 */
 	{
-		.regulators = { "vdd-csiphy-0p8",
-				"vdd-csiphy-1p2" },
+		.regulators = {
+			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
+			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
+		},
 		.clock = { "csiphy4", "csiphy4_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index a70fbc78ccc3..3d5095158338 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -43,7 +43,7 @@
 #define CAMSS_RES_MAX 17
 
 struct camss_subdev_resources {
-	char *regulators[CAMSS_RES_MAX];
+	struct regulator_bulk_data regulators[CAMSS_RES_MAX];
 	char *clock[CAMSS_RES_MAX];
 	char *clock_for_reset[CAMSS_RES_MAX];
 	u32 clock_rate[CAMSS_RES_MAX][CAMSS_RES_MAX];
-- 
2.34.1


