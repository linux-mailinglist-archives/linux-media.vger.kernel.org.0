Return-Path: <linux-media+bounces-38614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7666EB1490B
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 09:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FC1C540BC3
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 07:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17744263F36;
	Tue, 29 Jul 2025 07:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h0Nde5QY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F83825A34F;
	Tue, 29 Jul 2025 07:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753773925; cv=none; b=bRECHQVHRMohYXfVwykdNjFS8+XBN+od7Y/OU4mVVVjD5xh5gQ6vpHt5CLcy00e6rlzzYR864ny4/USqcTfO/nJY5ySqRW6IqQk93fjrs074KHMtMbMTYJ2Z7CNI9F0N8Zai+ElJOyYWud/OLsP93Q1ODhSoxSFzhWSRmEJOIY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753773925; c=relaxed/simple;
	bh=3oLvzg2LALK7ZKr735lj9tvzgSU/gYhB8G7aMbfqdw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=fzwnsEkFdOaHhjeympxr2p11t7kl3SIkVrYjwFhQaSbpSA9Bl4f7PD4DgEscir2eKFb9AhCkJS2BsD8dUC49f2hk2UbvVrq54AT0iuOTXaMrZDRk7zgQGZVl0p+8xrXFd3E2boEDJVlVF9WA/ILZmVYZ9yWpjbcqWE36F7I6xWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h0Nde5QY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SMDhgj012147;
	Tue, 29 Jul 2025 07:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NpzSBali8HFXORJ2UrAAOw
	x5yEv06UDkaQJ+VO/CHRc=; b=h0Nde5QYxxkV+vgTgzkQWrD2oZnmzxXYvhJltn
	ahC2jGdWhKZ1yLJCkE+Sd6g/ANCKqCnV51YMbpckd8zszcxN/lle1PjkcS43u31F
	yLloxvqnnBTOV2Eg7rVAyOz2t2Y+WBO6Kqnmj+TaIyDHZn81kDawRmf9V8+D/zVP
	XDbOi0gG+SMpsdff5NGCzvOqk6g1gzNWuusKrC+PTENgJXrpP/ppftaVbvYdc9rD
	OcOY5JKw7Z3whx52haoyOkYqJliF7Dk0iAWKMPMuV8bORPzad8hkFdcKpBv6WxGc
	7QjTGH5XX5GFwOndC6em4ydj1vjkbZoHOFW2K4O11mk8i6TQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qsk75sj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 07:25:16 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56T7PFq5000958
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 07:25:15 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 29 Jul 2025 00:25:12 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Date: Tue, 29 Jul 2025 15:24:55 +0800
Subject: [PATCH v2] media: qcom: camss: Add support for regulator
 init_load_uA in CSIPHY
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250729-camss_csiphy_current-v2-1-da3c72a2055c@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEd3iGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDcyNL3eTE3OLi+OTizIKMyvjk0qKi1LwSXXNzS+Nko7TEJDOzNCWg1oK
 i1LTMCrCx0bG1tQD88QlHZgAAAA==
X-Change-ID: 20250729-camss_csiphy_current-7793c2fab66f
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Wenmeng Liu <quic_wenmliu@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753773912; l=11102;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=3oLvzg2LALK7ZKr735lj9tvzgSU/gYhB8G7aMbfqdw8=;
 b=UMrrX1HfYc359AjNhccj+KU8gu3SpHcUDUS/T2KO2Jsu7tM0T28cVEgCUJmeSRZOddFkVuzLN
 Aah7a7ptufzDvonwUWqoH+TegrTVQGxqb+Ii5TlGQp4cL3QnF4MjvOk
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KdDSsRYD c=1 sm=1 tr=0 ts=6888775c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=-Pl-RTQkTo2ai6zIkRIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WyQE32ug4Y3qfVP5e2VIiczv7Q3EMZVw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA1NCBTYWx0ZWRfX5pXWhZpda3L7
 OiGlzjHSh8aepHj7P21xUoHL6IllaZ3DinWIq6YsUyPfSof7FVKlVb6FVys3Gc+0jnZVxOeCs7Q
 wC/MTE1Jp4F1Wdi/J1PRMLJY8lP986pvMfr904TuamAOtC7zPsaYMCaAcSP5ohS4DBYjHlGj+7y
 zjiCOjx/WgfjB2EzL+MnkO7Wd8hP9ybsanBGbbO0QbYau85VsnQUnjxOOPhMJH/eJwMOLnLL0ZU
 2Ol80+Hyw9yfoPFJsvsawPPY+yAhLkCOQ/HT2IoDGh7Y8cNIiWh2Vym+fmLHEDKtO35kso4yCwe
 XCQnBkXR91nLO3MowNqUPDVOoR3iCh+s06nmTHeyAYe7yE2QiOiYAeYvIpcMX/g6kyOy3+dsuLW
 3cwGSNFW6MQbukw7G8Dy69e7gBd3k63C4U1E+3LvIGdX3iiCdDYKMLuJGavgPE/OU46n7pEj
X-Proofpoint-ORIG-GUID: WyQE32ug4Y3qfVP5e2VIiczv7Q3EMZVw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_01,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290054

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
SDM670, SM8250, SC7280, SM8550, and X1E80100.

For SDM670, the value is set to -1, indicating that no default
current value is configured, the other values are derived
from the power grid.

---
Changes in v2:
- Change the source of the current value from DTS to CAMSS resource
- Link to v1: https://lore.kernel.org/all/20250620040736.3032667-1-quic_wenmliu@quicinc.com/
---

Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c |  4 +++-
 drivers/media/platform/qcom/camss/camss.c        | 26 ++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h        |  1 +
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 2de97f58f9ae4f91e8bba39dcadf92bea8cf6f73..7a2d80a03dbd0884b614451b55cd27dce94af637 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -707,8 +707,10 @@ int msm_csiphy_subdev_init(struct camss *camss,
 			return -ENOMEM;
 	}
 
-	for (i = 0; i < csiphy->num_supplies; i++)
+	for (i = 0; i < csiphy->num_supplies; i++) {
 		csiphy->supplies[i].supply = res->regulators[i];
+		csiphy->supplies[i].init_load_uA = res->regulators_current[i];
+	}
 
 	ret = devm_regulator_bulk_get(camss->dev, csiphy->num_supplies,
 				      csiphy->supplies);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index e08e70b93824baa5714b3a736bc1d05405253aaa..daf21c944c2b4818b1656efc255e817551788658 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -750,6 +750,7 @@ static const struct camss_subdev_resources csiphy_res_670[] = {
 	/* CSIPHY0 */
 	{
 		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators_current = { -1, -1 },
 		.clock = { "soc_ahb", "cpas_ahb",
 			   "csiphy0", "csiphy0_timer" },
 		.clock_rate = { { 0 },
@@ -768,6 +769,7 @@ static const struct camss_subdev_resources csiphy_res_670[] = {
 	/* CSIPHY1 */
 	{
 		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators_current = { -1, -1 },
 		.clock = { "soc_ahb", "cpas_ahb",
 			   "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 0 },
@@ -786,6 +788,7 @@ static const struct camss_subdev_resources csiphy_res_670[] = {
 	/* CSIPHY2 */
 	{
 		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators_current = { -1, -1 },
 		.clock = { "soc_ahb", "cpas_ahb",
 			   "csiphy2", "csiphy2_timer" },
 		.clock_rate = { { 0 },
@@ -1188,6 +1191,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 	/* CSIPHY0 */
 	{
 		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators_current = { 17500, 10000 },
 		.clock = { "csiphy0", "csiphy0_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -1202,6 +1206,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 	/* CSIPHY1 */
 	{
 		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators_current = { 17500, 10000 },
 		.clock = { "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -1216,6 +1221,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 	/* CSIPHY2 */
 	{
 		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators_current = { 17500, 10000 },
 		.clock = { "csiphy2", "csiphy2_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -1230,6 +1236,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 	/* CSIPHY3 */
 	{
 		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators_current = { 17500, 10000 },
 		.clock = { "csiphy3", "csiphy3_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -1244,6 +1251,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 	/* CSIPHY4 */
 	{
 		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators_current = { 17500, 10000 },
 		.clock = { "csiphy4", "csiphy4_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -1258,6 +1266,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 	/* CSIPHY5 */
 	{
 		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators_current = { 17500, 10000 },
 		.clock = { "csiphy5", "csiphy5_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -1472,6 +1481,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 	/* CSIPHY0 */
 	{
 		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators_current = { 16100, 9000 },
 
 		.clock = { "csiphy0", "csiphy0_timer" },
 		.clock_rate = { { 300000000, 400000000 },
@@ -1487,6 +1497,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 	/* CSIPHY1 */
 	{
 		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators_current = { 16100, 9000 },
 
 		.clock = { "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 300000000, 400000000 },
@@ -1502,6 +1513,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 	/* CSIPHY2 */
 	{
 		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators_current = { 16100, 9000 },
 
 		.clock = { "csiphy2", "csiphy2_timer" },
 		.clock_rate = { { 300000000, 400000000 },
@@ -1517,6 +1529,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 	/* CSIPHY3 */
 	{
 		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators_current = { 16100, 9000 },
 
 		.clock = { "csiphy3", "csiphy3_timer" },
 		.clock_rate = { { 300000000, 400000000 },
@@ -1532,6 +1545,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 	/* CSIPHY4 */
 	{
 		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators_current = { 16100, 9000 },
 
 		.clock = { "csiphy4", "csiphy4_timer" },
 		.clock_rate = { { 300000000, 400000000 },
@@ -2158,6 +2172,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 	/* CSIPHY0 */
 	{
 		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators_current = { 44000, 8900 },
 		.clock = { "csiphy0", "csiphy0_timer" },
 		.clock_rate = { { 400000000, 480000000 },
 				{ 400000000 } },
@@ -2172,6 +2187,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 	/* CSIPHY1 */
 	{
 		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators_current = { 44000, 8900 },
 		.clock = { "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 400000000, 480000000 },
 				{ 400000000 } },
@@ -2186,6 +2202,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 	/* CSIPHY2 */
 	{
 		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators_current = { 44000, 8900 },
 		.clock = { "csiphy2", "csiphy2_timer" },
 		.clock_rate = { { 400000000, 480000000 },
 				{ 400000000 } },
@@ -2200,6 +2217,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 	/* CSIPHY3 */
 	{
 		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators_current = { 44000, 8900 },
 		.clock = { "csiphy3", "csiphy3_timer" },
 		.clock_rate = { { 400000000, 480000000 },
 				{ 400000000 } },
@@ -2214,6 +2232,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 	/* CSIPHY4 */
 	{
 		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators_current = { 44000, 8900 },
 		.clock = { "csiphy4", "csiphy4_timer" },
 		.clock_rate = { { 400000000, 480000000 },
 				{ 400000000 } },
@@ -2228,6 +2247,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 	/* CSIPHY5 */
 	{
 		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators_current = { 44000, 8900 },
 		.clock = { "csiphy5", "csiphy5_timer" },
 		.clock_rate = { { 400000000, 480000000 },
 				{ 400000000 } },
@@ -2242,6 +2262,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 	/* CSIPHY6 */
 	{
 		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators_current = { 44000, 8900 },
 		.clock = { "csiphy6", "csiphy6_timer" },
 		.clock_rate = { { 400000000, 480000000 },
 				{ 400000000 } },
@@ -2256,6 +2277,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 	/* CSIPHY7 */
 	{
 		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators_current = { 44000, 8900 },
 		.clock = { "csiphy7", "csiphy7_timer" },
 		.clock_rate = { { 400000000, 480000000 },
 				{ 400000000 } },
@@ -2488,6 +2510,7 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	{
 		.regulators = { "vdd-csiphy-0p8",
 				"vdd-csiphy-1p2" },
+		.regulators_current = { 105000, 58900 },
 		.clock = { "csiphy0", "csiphy0_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
@@ -2503,6 +2526,7 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	{
 		.regulators = { "vdd-csiphy-0p8",
 				"vdd-csiphy-1p2" },
+		.regulators_current = { 105000, 58900 },
 		.clock = { "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
@@ -2518,6 +2542,7 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	{
 		.regulators = { "vdd-csiphy-0p8",
 				"vdd-csiphy-1p2" },
+		.regulators_current = { 105000, 58900 },
 		.clock = { "csiphy2", "csiphy2_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
@@ -2533,6 +2558,7 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	{
 		.regulators = { "vdd-csiphy-0p8",
 				"vdd-csiphy-1p2" },
+		.regulators_current = { 105000, 58900 },
 		.clock = { "csiphy4", "csiphy4_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 63c0afee154a02194820016ccf554620d6521c8b..b46e92b10e096ca8e082ea2bb0b20032135e05b9 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -44,6 +44,7 @@
 
 struct camss_subdev_resources {
 	char *regulators[CAMSS_RES_MAX];
+	int  regulators_current[CAMSS_RES_MAX];
 	char *clock[CAMSS_RES_MAX];
 	char *clock_for_reset[CAMSS_RES_MAX];
 	u32 clock_rate[CAMSS_RES_MAX][CAMSS_RES_MAX];

---
base-commit: 0b90c3b6d76ea512dc3dac8fb30215e175b0019a
change-id: 20250729-camss_csiphy_current-7793c2fab66f

Best regards,
-- 
Wenmeng Liu <quic_wenmliu@quicinc.com>


