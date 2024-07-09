Return-Path: <linux-media+bounces-14784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEED92BF4E
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 18:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E42B31C22E37
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 16:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1871A3BB8;
	Tue,  9 Jul 2024 16:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fz2vdARB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC6A1A38D0;
	Tue,  9 Jul 2024 16:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720541265; cv=none; b=PigPAfMgeMtu7jDUP/zhz0vCMk8g60fQe7cHBCFC0xwnh/njxVDuVRUBGpO3hlaOTwH/w5URUuvwQMr0LCvwyUujqQivUYu6rW1Jz+TPPEwJsEQIQNHa77loJ7N9ViSEMX7aFfaoijkINslJ+CKMa3LDD8KwvUy2Re6fGUvELcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720541265; c=relaxed/simple;
	bh=DlqobUcut3ksDz5AgS/CK46aLhXZ1lhUUg/qbSYu03A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nPMHQIn2WvJy9D7csSzNu7nvHGyoOSU/VlE6t6a6i79A6ltnsTqS+aa6EiD5cmd7Ei5yO/0lVPdhY8bjFDWdKGFN+rfM8U13ppeg+jg+5qrOMEpH4zWs/Cj3IPuNsG/STLKB7j7V/oDt9MKKlfYk4r6awFDRHrMFKAFIYr40+Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fz2vdARB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4698HAW0026708;
	Tue, 9 Jul 2024 16:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cw5OnyRvyQUZeSwlYWh+6gtO
	CUNy16Yvfrrhm0tT/ZE=; b=Fz2vdARBP3hkCtruaOq/J32SerBi/Az0K8GzTHU1
	Gi26q6pDwOlb/AiOp9+2wQLqvgcK11gkK6FQmQksDpXhiNOmEeqJIsKeqM4O6tm7
	Bjvnjv3J02psHGv78kpP1DgNdtw7oHNM2o3udVBwCBLwosOJgW6m99yJqFFFGEpe
	aJAIh36C8xpu/MM0N3fgMqzmyr56cDustjtl62M3fFWJyU0bI7QMHnZqEpfgBsJF
	RTaY0vfHbjmX51NXXlxcXjxUA6ZJw2vfaTbqqiDzGrQMM4UsuFw5Jx/h2CC7Ntgq
	WeqKYqRuAtaIo/sKRHTs6FEsvfE7gFdPZkDhC5GKIcH9cw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4091jdh78v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 16:07:39 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469G7dD2032063
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 16:07:39 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 09:07:33 -0700
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH 06/13] media: qcom: camss: csiphy-3ph: Use an offset variable to find common control regs
Date: Tue, 9 Jul 2024 21:36:49 +0530
Message-ID: <20240709160656.31146-7-quic_depengs@quicinc.com>
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
X-Proofpoint-GUID: OByNESckAr_We86snourALCf025MAvXy
X-Proofpoint-ORIG-GUID: OByNESckAr_We86snourALCf025MAvXy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_05,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407090106

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

New versions of the CSIPHY locate the control registers at offset 0x1000
not offset 0x800.

Provide a variable to base an offset from for the purposes of redirecting
the base offset for the new PHY regs layout.

The existing setup bases from 0x800, the new from 0x1000 with some of the
'EXT' registers dropped but the lower-order lane config regs at offset 0x00
and up the same as before.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 68 ++++++++++++-------
 1 file changed, 44 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 93782ebfe0ea..1219a25ec55b 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -42,11 +42,11 @@
 #define CSIPHY_3PH_LNn_CSI_LANE_CTRL15(n)	(0x03c + 0x100 * (n))
 #define CSIPHY_3PH_LNn_CSI_LANE_CTRL15_SWI_SOT_SYMBOL	0xb8
 
-#define CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(n)	(0x800 + 0x4 * (n))
+#define CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(offset, n)	(offset + 0x4 * (n))
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE	BIT(7)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
-#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(n)	(0x8b0 + 0x4 * (n))
+#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset + 0xb0) + 0x4 * (n))
 
 #define CSIPHY_DEFAULT_PARAMS		0
 #define CSIPHY_LANE_ENABLE		1
@@ -66,6 +66,7 @@ struct csiphy_lane_regs {
 struct csiphy_device_regs {
 	const struct csiphy_lane_regs *lane_regs;
 	int lane_array_size;
+	u32 offset;
 };
 
 /* GEN2 1.0 2PH */
@@ -326,19 +327,20 @@ csiphy_lane_regs lane_regs_sm8250[] = {
 static void csiphy_hw_version_read(struct csiphy_device *csiphy,
 				   struct device *dev)
 {
+	struct csiphy_device_regs *regs = csiphy->data;
 	u32 hw_version;
 
-	writel(CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID,
-	       csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(6));
+	writel(CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID, csiphy->base +
+	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
 
 	hw_version = readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(12));
+				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 12));
 	hw_version |= readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(13)) << 8;
+				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 13)) << 8;
 	hw_version |= readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(14)) << 16;
+				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 14)) << 16;
 	hw_version |= readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(15)) << 24;
+				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 15)) << 24;
 
 	dev_dbg(dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);
 }
@@ -349,31 +351,39 @@ static void csiphy_hw_version_read(struct csiphy_device *csiphy,
  */
 static void csiphy_reset(struct csiphy_device *csiphy)
 {
-	writel_relaxed(0x1, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(0));
+	struct csiphy_device_regs *regs = csiphy->data;
+
+	writel_relaxed(0x1, csiphy->base +
+		      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
 	usleep_range(5000, 8000);
-	writel_relaxed(0x0, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(0));
+	writel_relaxed(0x0, csiphy->base +
+		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
 }
 
 static irqreturn_t csiphy_isr(int irq, void *dev)
 {
 	struct csiphy_device *csiphy = dev;
+	struct csiphy_device_regs *regs = csiphy->data;
 	int i;
 
 	for (i = 0; i < 11; i++) {
 		int c = i + 22;
 		u8 val = readl_relaxed(csiphy->base +
-				       CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(i));
+				       CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, i));
 
 		writel_relaxed(val, csiphy->base +
-				    CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(c));
+			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, c));
 	}
 
-	writel_relaxed(0x1, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(10));
-	writel_relaxed(0x0, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(10));
+	writel_relaxed(0x1, csiphy->base +
+		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 10));
+	writel_relaxed(0x0, csiphy->base +
+		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 10));
 
-	for (i = 22; i < 33; i++)
+	for (i = 22; i < 33; i++) {
 		writel_relaxed(0x0, csiphy->base +
-				    CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(i));
+			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, i));
+	}
 
 	return IRQ_HANDLED;
 }
@@ -528,6 +538,7 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 				s64 link_freq, u8 lane_mask)
 {
 	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
+	struct csiphy_device_regs *regs = csiphy->data;
 	u8 settle_cnt;
 	u8 val;
 	int i;
@@ -538,16 +549,20 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 	for (i = 0; i < c->num_data; i++)
 		val |= BIT(c->data[i].pos * 2);
 
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(5));
+	writel_relaxed(val, csiphy->base +
+		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
 
 	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(6));
+	writel_relaxed(val, csiphy->base +
+		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
 
 	val = 0x02;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(7));
+	writel_relaxed(val, csiphy->base +
+		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 7));
 
 	val = 0x00;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(0));
+	writel_relaxed(val, csiphy->base +
+		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
 
 	if (csiphy_is_gen2(csiphy->camss->res->version))
 		csiphy_gen2_config_lanes(csiphy, settle_cnt);
@@ -555,18 +570,22 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 		csiphy_gen1_config_lanes(csiphy, cfg, settle_cnt);
 
 	/* IRQ_MASK registers - disable all interrupts */
-	for (i = 11; i < 22; i++)
-		writel_relaxed(0, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(i));
+	for (i = 11; i < 22; i++) {
+		writel_relaxed(0, csiphy->base +
+			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, i));
+	}
 }
 
 static void csiphy_lanes_disable(struct csiphy_device *csiphy,
 				 struct csiphy_config *cfg)
 {
+	struct csiphy_device_regs *regs = csiphy->data;
+
 	writel_relaxed(0, csiphy->base +
-			  CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(5));
+			  CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
 
 	writel_relaxed(0, csiphy->base +
-			  CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(6));
+			  CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
 }
 
 static int csiphy_init(struct csiphy_device *csiphy)
@@ -579,6 +598,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		return -ENOMEM;
 
 	csiphy->data = regs;
+	regs->offset = 0x800;
 
 	switch (csiphy->camss->res->version) {
 	case CAMSS_845:
-- 
2.34.1


