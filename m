Return-Path: <linux-media+bounces-47059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CC9C5BF99
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 09:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 198AC4E80CC
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 08:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4E92FB96A;
	Fri, 14 Nov 2025 08:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YMKDYdox";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cImzf8QF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D462FB0BB
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 08:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763108830; cv=none; b=GgpcAScZW7mmMKilbakV3xvp8JAe3QuTbQu5uTNjTlzZdsGCe+Z/b/Jcpw49SSCRqweBdpcxUXrIS/FpGL4HJ5TwouPOaOUw5bjKALwbikSscDvXMWXSfu61dwTYtb5YDW0Y1qN+ig6sNqinUfx19RuwC0R5mX8G9rp6VhYmSIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763108830; c=relaxed/simple;
	bh=7W0M9mFxMaS+p9gt1LpzheTeRWrfqwFFXSZoem9kw3o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NsUiT7l91YqoNynp3dvEEkmUObu9CncgJ4BpVh3I9T7eAvHHlpo+44Kzf3vQBpbIQFxgyylXUgzDH/jasL35vAkrr1E+OKrDk5vRE/yMTQmVsksDHncaC6YrFLHDKCknVTL1oWR9/ZZ7uUJwWyE7Q5JuMmouMC1pT3TC0eS1eZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YMKDYdox; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cImzf8QF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE7wZ411484516
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 08:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KSPkww7bB55fDzz++Kh3I5Ke4agBLjhsTz6
	KHxhbHR4=; b=YMKDYdoxZVpvMguutvgJu+wv83/+RBTUSlPn2392H8StPM6qAdy
	vgB9Don228Mc4mVBojDpzA9pJ5ZD2GUNsFuXVNm2uhjvL22dOarD+bfvpLqaE+9n
	L+JBIyk9iTqpGFPp3oDz78S0wr3649+BSmCjaIczRab1up3VCVLu6ZiFXFqEb/Y+
	zsu7PawNDuyW1Jn3hpiQPWXgzkyTYPQ/ZeaziGBI6b8uidTnTnpBpfwXodRPStUf
	LR/i4kyor6mNA5yBkVmxtVwV/BUaUOTnaglki5fhwfCV6aAv4HiRn9TJhcBUgLq3
	pluAJgW6eex9zlxo+vrgLKufOJVQn+GPn1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9chehg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 08:27:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b29fabd8bfso431286785a.3
        for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 00:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763108825; x=1763713625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KSPkww7bB55fDzz++Kh3I5Ke4agBLjhsTz6KHxhbHR4=;
        b=cImzf8QFuVjitsgs6SQqu2MBIubzJT2gI60BtQk/rDzKZS/epRtxxAsCG5GU9Njpir
         j/tcO+PAVF776wrPINJZM/plOCTvXDTnZYkapRqpST16maPxjdtv/qVXbFmvwzDyMYNh
         3+QMCg1zSHyHCrdpNqk/N0H8d9pJEa++nVhAWje/vufsMP8rNmykBMmgUUkYKEesLbpT
         HUl1X0xuhAzoOK++K+UBIfNrywj/sFdukbsEp2ilROQliO8RYKIRqMGKnsqXmSUt3cg0
         wkwkfvKpe1CiyWy8AlUwdcP12nh6Xv+pv+NhC7xAJbL2C1KTsX6tqDU1CJPHiRWVDpys
         unKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763108825; x=1763713625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSPkww7bB55fDzz++Kh3I5Ke4agBLjhsTz6KHxhbHR4=;
        b=uM2httfccvpTf8sl9/vB8I6Pjt4jD16w2a6Tm37ERcrVSEd9v+LR0O3+6fBFYxrbvi
         QOJzVUd5i9+DglqW2JWYCjgHJDL/caEt3UGr1ciKK9q3Ia0IF26eUhePmJRUJ98oZkdn
         UBYX/fthEkzxVDi1CZPTR+xw/4FgiKzze8DsSSAcKci2psKpjFEymnY7iBw8gC4e7Uub
         E45iMfTe1gLcWlGo3v6K45UxgW3J5r7Yyd1rwjGgxDsEWHimtFWr2bWxA6xZlpuADya5
         HSFCJtmf6JVqQ16WQ+rfgcYWYwvygHqj7YJQl9mSmRtzmDCvpYUuRXnIQJp1/xaFgQil
         W18g==
X-Gm-Message-State: AOJu0Ywd47MWOd/v7XerFN2+ICBkfx2FVA2kdW1iXRIIBZ5DtwTrE+OD
	7i3qg0DQ3EIGIwpftcnv1B+hJczTMokMiehaR571BX698LYNjRtZLU56TPNrfS/Ay95UIggzckw
	uu7f3SABzVTuq7UhmQvUBascjRg7L9CZv8AHlde3tF3uKRFPbr8qbv1d/W5pT+toQjw==
X-Gm-Gg: ASbGncs9oQ3e95EZox9C9FOI5Vj4EGx5YRUil9rgFhSTcudtk3y5rf2knl1j8McUkaK
	X8txH+Bi1dyiPGyNFi/6P5mIgEdo12ypBQUWZorIvE25uL2EI21Ac5KKdfwsdHiRtlYF/gTUkLS
	HXwpK9bSPcEnYnWLpbtCl4uicbfxh+bFxTNjzlaIRpst1f7XTZmFjgHYUEioul5TBxJUxtbkqR/
	TPQScd+pE9T0rvgxphaqTRNUJp65bZETGF8IyEz66XKBx1LkjwegnisLCDrehjDyNNavrgJykVl
	2BRM/aWVAzOGX+tLbbhKGs+Gshi/2+AYvhCyb+FFBbyawUciO46M0X9nPNrQ8k4YrfWZFqVPNvc
	GXGdMJ7qqjGQpu304tWwo8BKa+jQggqmt34ml/0znPFIx9Yz7NNF8eOHSeUcP2A==
X-Received: by 2002:a05:620a:4611:b0:89e:c2ef:ea03 with SMTP id af79cd13be357-8b2c31e8bb7mr263737385a.82.1763108824238;
        Fri, 14 Nov 2025 00:27:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6mC7QufbRJvP28/6QDQhxJgYzHAZz/HhymKR78eARjXxQMSo3ueopWXdXiGMbt3X26rE8bA==
X-Received: by 2002:a05:620a:4611:b0:89e:c2ef:ea03 with SMTP id af79cd13be357-8b2c31e8bb7mr263725385a.82.1763108820426;
        Fri, 14 Nov 2025 00:27:00 -0800 (PST)
Received: from WENMLIU-LAB01.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aee9eeeasm293422985a.9.2025.11.14.00.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 00:26:59 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
To: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, wenmeng.liu@oss.qualcomm.com
Subject: [PATCH v4] media: qcom: camss: Add support for regulator init_load_uA in CSIPHY
Date: Fri, 14 Nov 2025 16:26:49 +0800
Message-Id: <20251114082649.4240-1-wenmeng.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SXBh7AIg9erkTDKihXjehCu26rh4Envy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA2NSBTYWx0ZWRfX00hB85Krrmw+
 lbRC05y6Y2L7XQRpj8XsQix4EjlU6g/4uZXLDi/hdpob6UdqmTd85KM0e8bchSDhUO8RHcCJMNz
 hsjhM8YeFqhTqqw17fC1KgPzpk9gPra/H40RTUj9dv6jhcpa9d/Vo9AiCMWLu6u1XywNRIUGjfk
 Ptnu6Gz2JHoziXF07SYCnIAI9AltRFHlVXDqx8RgW+e8ff6qjyEBSbxmZAI/RaEetMq28nQuGaW
 Pav172cqU03D1ONBzXobaG0XhKwMY2Cr73Fwgd9EkBzNIZ+XqiHdaKfQGUynnheLFZ3WPAbWQ5X
 Tq4LAINcwnthEdH0uu3dozk9v2k61z43XpICP3jS1dh+WicdC6jH1Ubu/IjFynFGC0kOGYtgPnh
 NKgsTaqLnH2p20Q6spgPYbqIqBuMjw==
X-Authority-Analysis: v=2.4 cv=MNdtWcZl c=1 sm=1 tr=0 ts=6916e7d9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=5sd4MONqg-jDtnBtIU4A:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SXBh7AIg9erkTDKihXjehCu26rh4Envy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140065

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
MSM8916, MSM8939, MSM8953, MSM8996, QCM2290, SDM670, SM8250, SC7280,
SM8550, SM8650, QCS8300, SA8775P and X1E80100.

For SDM660, SDM845, SC8280XP the value is set to 0,
indicating that no default current value is configured,
the other values are derived from the power grid.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Changes in v4:
- Add MSM8939 SM8650 support.
- Link to v3:https://lore.kernel.org/all/20250912103631.1184-1-wenmeng.liu@oss.qualcomm.com/

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
 drivers/media/platform/qcom/camss/camss.c     | 328 ++++++++++++++----
 drivers/media/platform/qcom/camss/camss.h     |   2 +-
 4 files changed, 265 insertions(+), 102 deletions(-)

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
index a734fb7dde0a..62623393f414 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -695,24 +695,13 @@ int msm_csiphy_subdev_init(struct camss *camss,
 
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
index fcc2b2c3cba0..6cfb71fcd861 100644
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
 static const struct camss_subdev_resources csiphy_res_8x39[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = { "vdda" },
+		.regulators = {
+			{ .supply = "vdda", .init_load_uA = 40000 }
+		},
 		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy0_timer" },
 		.clock_rate = { { 0 },
 				{ 40000000, 80000000 },
@@ -174,7 +180,9 @@ static const struct camss_subdev_resources csiphy_res_8x39[] = {
 
 	/* CSIPHY1 */
 	{
-		.regulators = { "vdda" },
+		.regulators = {
+			{ .supply = "vdda", .init_load_uA = 40000 }
+		},
 		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy1_timer" },
 		.clock_rate = { { 0 },
 				{ 40000000, 80000000 },
@@ -300,7 +308,9 @@ static const struct camss_subdev_resources vfe_res_8x39[] = {
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
@@ -323,7 +333,9 @@ static const struct camss_subdev_resources csid_res_8x53[] = {
 
 	/* CSID1 */
 	{
-		.regulators = { "vdda" },
+		.regulators = {
+			{ .supply = "vdda", .init_load_uA = 9900 }
+		},
 		.clock = { "top_ahb", "ispif_ahb", "csi1_ahb", "ahb",
 			   "csi1", "csi1_phy", "csi1_pix", "csi1_rdi" },
 		.clock_rate = { { 0 },
@@ -346,7 +358,9 @@ static const struct camss_subdev_resources csid_res_8x53[] = {
 
 	/* CSID2 */
 	{
-		.regulators = { "vdda" },
+		.regulators = {
+			{ .supply = "vdda", .init_load_uA = 9900 }
+		},
 		.clock = { "top_ahb", "ispif_ahb", "csi2_ahb", "ahb",
 			   "csi2", "csi2_phy", "csi2_pix", "csi2_rdi" },
 		.clock_rate = { { 0 },
@@ -507,7 +521,9 @@ static const struct camss_subdev_resources csiphy_res_8x96[] = {
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
@@ -529,7 +545,9 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
 
 	/* CSID1 */
 	{
-		.regulators = { "vdda" },
+		.regulators = {
+			{ .supply = "vdda", .init_load_uA = 80160 }
+		},
 		.clock = { "top_ahb", "ispif_ahb", "csi1_ahb", "ahb",
 			   "csi1", "csi1_phy", "csi1_pix", "csi1_rdi" },
 		.clock_rate = { { 0 },
@@ -551,7 +569,9 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
 
 	/* CSID2 */
 	{
-		.regulators = { "vdda" },
+		.regulators = {
+			{ .supply = "vdda", .init_load_uA = 80160 }
+		},
 		.clock = { "top_ahb", "ispif_ahb", "csi2_ahb", "ahb",
 			   "csi2", "csi2_phy", "csi2_pix", "csi2_rdi" },
 		.clock_rate = { { 0 },
@@ -573,7 +593,9 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
 
 	/* CSID3 */
 	{
-		.regulators = { "vdda" },
+		.regulators = {
+			{ .supply = "vdda", .init_load_uA = 80160 }
+		},
 		.clock = { "top_ahb", "ispif_ahb", "csi3_ahb", "ahb",
 			   "csi3", "csi3_phy", "csi3_pix", "csi3_rdi" },
 		.clock_rate = { { 0 },
@@ -661,7 +683,10 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
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
@@ -678,7 +703,10 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
 
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
@@ -854,7 +882,10 @@ static const struct camss_subdev_resources csiphy_res_660[] = {
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
@@ -879,7 +910,10 @@ static const struct camss_subdev_resources csid_res_660[] = {
 
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
@@ -904,7 +938,10 @@ static const struct camss_subdev_resources csid_res_660[] = {
 
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
@@ -929,7 +966,10 @@ static const struct camss_subdev_resources csid_res_660[] = {
 
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
@@ -1026,7 +1066,10 @@ static const struct camss_subdev_resources vfe_res_660[] = {
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
@@ -1044,7 +1087,10 @@ static const struct camss_subdev_resources csiphy_res_670[] = {
 
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
@@ -1062,7 +1108,10 @@ static const struct camss_subdev_resources csiphy_res_670[] = {
 
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
@@ -1302,7 +1351,10 @@ static const struct camss_subdev_resources csiphy_res_845[] = {
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
@@ -1327,7 +1379,10 @@ static const struct camss_subdev_resources csid_res_845[] = {
 
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
@@ -1352,7 +1407,10 @@ static const struct camss_subdev_resources csid_res_845[] = {
 
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
@@ -1464,7 +1522,10 @@ static const struct camss_subdev_resources vfe_res_845[] = {
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
@@ -1478,7 +1539,10 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
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
@@ -1492,7 +1556,10 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
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
@@ -1506,7 +1573,10 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
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
@@ -1520,7 +1590,10 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
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
@@ -1534,7 +1607,10 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
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
@@ -1748,7 +1824,10 @@ static const struct resources_icc icc_res_sm8250[] = {
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
@@ -1763,7 +1842,10 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
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
@@ -1778,7 +1860,10 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
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
@@ -1793,7 +1878,10 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
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
@@ -1808,7 +1896,10 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
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
@@ -2121,7 +2212,10 @@ static const struct camss_subdev_resources csiphy_res_sc8280xp[] = {
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
@@ -2137,7 +2231,10 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
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
@@ -2153,7 +2250,10 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
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
@@ -2169,7 +2269,10 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
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
@@ -2185,7 +2288,10 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
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
@@ -2201,7 +2307,10 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
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
@@ -2217,7 +2326,10 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
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
@@ -2233,7 +2345,10 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
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
@@ -2434,7 +2549,10 @@ static const struct resources_icc icc_res_sc8280xp[] = {
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
@@ -2448,7 +2566,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
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
@@ -2462,7 +2583,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
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
@@ -2476,7 +2600,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
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
@@ -2490,7 +2617,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
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
@@ -2504,7 +2634,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
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
@@ -2518,7 +2651,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
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
@@ -2532,7 +2668,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
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
@@ -2763,7 +2902,10 @@ static const struct resources_icc icc_res_sm8550[] = {
 static const struct camss_subdev_resources csiphy_res_sm8650[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = { "vdd-csiphy01-0p9", "vdd-csiphy01-1p2", },
+		.regulators = {
+			{ .supply = "vdd-csiphy01-0p9", .init_load_uA = 88000 },
+			{ .supply = "vdd-csiphy01-1p2", .init_load_uA = 17800 },
+		},
 		.clock = { "csiphy0", "csiphy0_timer" },
 		.clock_rate = {	{ 400000000 },
 				{ 400000000 } },
@@ -2777,7 +2919,10 @@ static const struct camss_subdev_resources csiphy_res_sm8650[] = {
 	},
 	/* CSIPHY1 */
 	{
-		.regulators = { "vdd-csiphy01-0p9", "vdd-csiphy01-1p2", },
+		.regulators = {
+			{ .supply = "vdd-csiphy01-0p9", .init_load_uA = 88000 },
+			{ .supply = "vdd-csiphy01-1p2", .init_load_uA = 17800 },
+		},
 		.clock = { "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 } },
@@ -2791,7 +2936,10 @@ static const struct camss_subdev_resources csiphy_res_sm8650[] = {
 	},
 	/* CSIPHY2 */
 	{
-		.regulators = { "vdd-csiphy24-0p9", "vdd-csiphy24-1p2", },
+		.regulators = {
+			{ .supply = "vdd-csiphy24-0p9", .init_load_uA = 147000 },
+			{ .supply = "vdd-csiphy24-1p2", .init_load_uA = 24400 },
+		},
 		.clock = { "csiphy2", "csiphy2_timer" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 } },
@@ -2805,7 +2953,10 @@ static const struct camss_subdev_resources csiphy_res_sm8650[] = {
 	},
 	/* CSIPHY3 */
 	{
-		.regulators = { "vdd-csiphy35-0p9", "vdd-csiphy35-1p2", },
+		.regulators = {
+			{ .supply = "vdd-csiphy35-0p9", .init_load_uA = 88000 },
+			{ .supply = "vdd-csiphy35-1p2", .init_load_uA = 17800 },
+		},
 		.clock = { "csiphy3", "csiphy3_timer" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 } },
@@ -2819,7 +2970,10 @@ static const struct camss_subdev_resources csiphy_res_sm8650[] = {
 	},
 	/* CSIPHY4 */
 	{
-		.regulators = { "vdd-csiphy24-0p9", "vdd-csiphy24-1p2", },
+		.regulators = {
+			{ .supply = "vdd-csiphy24-0p9", .init_load_uA = 147000 },
+			{ .supply = "vdd-csiphy24-1p2", .init_load_uA = 24400 },
+		},
 		.clock = { "csiphy4", "csiphy4_timer" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 } },
@@ -2833,7 +2987,10 @@ static const struct camss_subdev_resources csiphy_res_sm8650[] = {
 	},
 	/* CSIPHY5 */
 	{
-		.regulators = { "vdd-csiphy35-0p9", "vdd-csiphy35-1p2", },
+		.regulators = {
+			{ .supply = "vdd-csiphy35-0p9", .init_load_uA = 88000 },
+			{ .supply = "vdd-csiphy35-1p2", .init_load_uA = 17800 },
+		},
 		.clock = { "csiphy5", "csiphy5_timer" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 } },
@@ -3074,7 +3231,10 @@ static const struct resources_icc icc_res_sm8650[] = {
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
@@ -3092,7 +3252,10 @@ static const struct camss_subdev_resources csiphy_res_8300[] = {
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
@@ -3110,7 +3273,10 @@ static const struct camss_subdev_resources csiphy_res_8300[] = {
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
@@ -3131,7 +3297,10 @@ static const struct camss_subdev_resources csiphy_res_8300[] = {
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
@@ -3148,7 +3317,10 @@ static const struct camss_subdev_resources csiphy_res_8775p[] = {
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
@@ -3165,7 +3337,10 @@ static const struct camss_subdev_resources csiphy_res_8775p[] = {
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
@@ -3182,7 +3357,10 @@ static const struct camss_subdev_resources csiphy_res_8775p[] = {
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
@@ -3535,8 +3713,10 @@ static const struct resources_icc icc_res_sa8775p[] = {
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
@@ -3550,8 +3730,10 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
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
@@ -3565,8 +3747,10 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
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
@@ -3580,8 +3764,10 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
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
index 9d9a62640e25..e34f06b4e153 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -44,7 +44,7 @@
 #define CAMSS_INIT_BUF_COUNT 2
 
 struct camss_subdev_resources {
-	char *regulators[CAMSS_RES_MAX];
+	struct regulator_bulk_data regulators[CAMSS_RES_MAX];
 	char *clock[CAMSS_RES_MAX];
 	char *clock_for_reset[CAMSS_RES_MAX];
 	u32 clock_rate[CAMSS_RES_MAX][CAMSS_RES_MAX];
-- 
2.34.1


