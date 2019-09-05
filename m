Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D58FAA0A1
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 12:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388046AbfIEK4x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 06:56:53 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:1412 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731974AbfIEK4l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 06:56:41 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x85AsLC3009041;
        Thu, 5 Sep 2019 03:56:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=0De0ccX7MfJiy4Pa9alZJyh8FbSjuWB5J3NzflGQzi4=;
 b=KfjF31a1Am4abgA75TJGX0BOpUyn2jEaellwfiVwLbmkfnDiuaWvc/lyFCyVzTI3UUll
 Vr4qFynJjv2EW8QyAzJMeKAFfOT6WYY0EWNL6Ra/OfwpURyxcOHd8EjkwXh8yW8CEoOm
 Tosvbcmvh/syNWFzRBEN1IS/iOJxkJjhwApg/Cfpec4/aXdT3XfPa8Y3Mjypr0j5E0Eg
 ynfOHoRtDmXFkzkS3l6y8QTElvKtk5qYo/H52rD7Nj0hQu8cS7Ga1VRzQC+zscbi+EJ5
 uInqOohjJNtU7FlXdTOkCCWaOgEKoELSs/aOw5DutESVO9u1P6MD9Jcl2yEdAROOMQPs zg== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam05-dm3-obe.outbound.protection.outlook.com (mail-dm3nam05lp2057.outbound.protection.outlook.com [104.47.49.57])
        by mx0b-0014ca01.pphosted.com with ESMTP id 2uqmfvvx4b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Sep 2019 03:56:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fy6MR1zaYszOY5tGcYEDBHNTQDIqRP8vsJ9X0hht56OEx5ojOi2316LQ/sbhlXMSCoCF9iM1tB+faCzZxlafv6PcKNgge2c3cIJOwRa2xrf6Pz3dyb5Wa/FEEta+c+zjVLbknW4tHXDLVv561xWhuAhjpxwTXxoNhPyE81LOPyw5PTAbmJr3LzLFb2Q5iYTSZSqHXBNqYTdC2ts0gVAOEtYgiPsbncqc4gFQJ3IkMzUOH4nXWAhqkqKUcO0kvaj/1DnuTXGDRg+U+YA5yjO7xpZ9lq7T23kJe6lren5JzERkxIKshezhsEVU36y749R20Bh3ykcpw4mlZhwhsc1SdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0De0ccX7MfJiy4Pa9alZJyh8FbSjuWB5J3NzflGQzi4=;
 b=U0w+k50xTb77R9+kqZhZoCYK6XnnxGL1cHREBY06MeD1lCmLAAsK46tt7f1Tyh7qVumUhIQu7+zL1NC5RMiTVKaBWoibv3OvdiafOa6ar2QM8ZflzTJISMWyIKUl9dK2VUouKyIotMqaY3lvIgTVAwzoxBlNM6iI74UNoYtZe73ECV2txm076UW/5HXJfDrI2Fj47QKvkGMJHHmnzixrceSROhQ4BMbtehl4rFXX4ljCYeIev0jAXedzxBtRG/+cObr02byWcSQpqo0z+8JsTjK90pakNgum/ZUI/2oJKDKxE7uUwadk/fsNRLpmaY5uKc7Sd01OnHLO2xf6dX6rhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 199.43.4.28) smtp.rcpttodomain=kernel.org smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0De0ccX7MfJiy4Pa9alZJyh8FbSjuWB5J3NzflGQzi4=;
 b=ZzUpUZ7Tc7kv4+i8hpqYI670GMO05VByNjmHrDEkDXS92f313UGo2I9l6rLYNpylhF73l8hVXUD8almurcoRvVOAY24ybQm9vvW5AVgr+EkrZ0NgI5bVc7yxgLn1/3WtsxI89jkAeo1/nwQz4FGRJye6O14FD7Sb+RFjnkbd1ZU=
Received: from SN4PR0701CA0029.namprd07.prod.outlook.com
 (2603:10b6:803:2d::14) by CO2PR07MB2599.namprd07.prod.outlook.com
 (2603:10b6:102:a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.20; Thu, 5 Sep
 2019 10:56:28 +0000
Received: from CO1NAM05FT008.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::200) by SN4PR0701CA0029.outlook.office365.com
 (2603:10b6:803:2d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.14 via Frontend
 Transport; Thu, 5 Sep 2019 10:56:28 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 CO1NAM05FT008.mail.protection.outlook.com (10.152.96.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.6 via Frontend Transport; Thu, 5 Sep 2019 10:56:27 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x85AuLtL025588
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Thu, 5 Sep 2019 06:56:26 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 5 Sep 2019 12:56:21 +0200
Received: from lvloginb.cadence.com (10.165.177.11) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 5 Sep 2019 12:56:21 +0200
Received: from lvloginb.cadence.com (localhost [127.0.0.1])
        by lvloginb.cadence.com (8.14.4/8.14.4) with ESMTP id x85AuLSP027215;
        Thu, 5 Sep 2019 11:56:21 +0100
Received: (from jank@localhost)
        by lvloginb.cadence.com (8.14.4/8.14.4/Submit) id x85AuLMb027203;
        Thu, 5 Sep 2019 11:56:21 +0100
From:   Jan Kotas <jank@cadence.com>
To:     <maxime.ripard@bootlin.com>, <mchehab@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <rafalc@cadence.com>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jan Kotas <jank@cadence.com>
Subject: [PATCH v2 3/3] media: Add support for Cadence CSI2RX 2.1
Date:   Thu, 5 Sep 2019 11:56:01 +0100
Message-ID: <20190905105601.27034-4-jank@cadence.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20190905105601.27034-1-jank@cadence.com>
References: <20190905105601.27034-1-jank@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28;IPV:CAL;SCL:-1;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(979002)(4636009)(346002)(396003)(39860400002)(376002)(136003)(2980300002)(36092001)(189003)(199004)(356004)(6666004)(86362001)(107886003)(305945005)(70206006)(76130400001)(48376002)(50466002)(70586007)(50226002)(1076003)(476003)(11346002)(2616005)(5660300002)(486006)(446003)(126002)(14444005)(186003)(53936002)(8936002)(426003)(4326008)(36756003)(42186006)(316002)(16586007)(76176011)(26826003)(478600001)(54906003)(110136005)(87636003)(336012)(2906002)(26005)(81156014)(81166006)(8676002)(51416003)(47776003)(2101003)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:CO2PR07MB2599;H:rmmaillnx1.cadence.com;FPR:;SPF:SoftFail;LANG:en;PTR:InfoDomainNonexistent;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f27c77fc-1a92-473d-de0c-08d731efb404
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328);SRVR:CO2PR07MB2599;
X-MS-TrafficTypeDiagnostic: CO2PR07MB2599:
X-Microsoft-Antispam-PRVS: <CO2PR07MB2599F09A8B4BBC51F952E2DAD0BB0@CO2PR07MB2599.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-Forefront-PRVS: 015114592F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: qhD40xHQz9HXv3bQ4CGnjpPYlWCdNGznZemuvnapynGlCzs23yE4d+6dJhAQkX2mCiCy8IHWri1YnP0/N7zBOV6Ng7ZxFzdgWveNLu4XXGypL7uApMjJOaHcgcATxPr5iAz7xyhyIvkM4i/2BwV7CQF/HLen2yzoA8NMlwPFBs4PLg47tafoSmoLGWb5SUpOimYKm36X1trxEYKN9xKHbRWhdyLPL6CUSGm4lpQqa/9vMNPL50Ga9HVjfNDBjcrOT9ipxuVrXPgNwH6pMsqTHg1OxwGEmz84FeFRfXhzIfPl/ucLjtBVPu7REn+kP3WTpcRqRHDjf1C31m/V1e1sLg40EfMZzpnT97e9nNsd8cQ9GZMBfRJa4Ep4RhCMn8h4BJ5UuVWaEpXo/VzGdjiiVo0V6iV24Oy5o3cnbkhk5Co=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2019 10:56:27.9814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f27c77fc-1a92-473d-de0c-08d731efb404
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[199.43.4.28];Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR07MB2599
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-05_03:2019-09-04,2019-09-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 phishscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 suspectscore=2 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1909050110
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds support for CSI2RX v2.1 version of the controller.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 139 ++++++++++++++++++++++-----
 1 file changed, 116 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 97ec09e72..aa1d46111 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * Driver for Cadence MIPI-CSI2 RX Controller v1.3
+ * Driver for Cadence MIPI-CSI2 RX Controller
  *
  * Copyright (C) 2017-2019 Cadence Design Systems Inc.
  */
@@ -26,6 +26,9 @@
 #define CSI2RX_SOFT_RESET_PROTOCOL			BIT(1)
 #define CSI2RX_SOFT_RESET_FRONT				BIT(0)
 
+#define CSI2RX_V2_CORE_CTRL_REG			0x004
+#define CSI2RX_V2_CORE_CTRL_START			BIT(0)
+
 #define CSI2RX_STATIC_CFG_REG			0x008
 #define CSI2RX_STATIC_CFG_DLANE_MAP(llane, plane)	((plane) << (16 + (llane) * 4))
 #define CSI2RX_STATIC_CFG_LANES_MASK			GENMASK(11, 8)
@@ -54,6 +57,15 @@ enum csi2rx_pads {
 	CSI2RX_PAD_MAX,
 };
 
+struct csi2rx_priv;
+
+/* CSI2RX Variant Operations */
+struct csi2rx_vops {
+	void (*get_dev_cfg)(struct csi2rx_priv *csi2rx);
+	void (*reset)(struct csi2rx_priv *csi2rx);
+	void (*map_static)(struct csi2rx_priv *csi2rx);
+};
+
 struct csi2rx_priv {
 	struct device			*dev;
 	unsigned int			count;
@@ -69,6 +81,7 @@ struct csi2rx_priv {
 	struct clk			*p_clk;
 	struct clk			*pixel_clk[CSI2RX_STREAMS_MAX];
 	struct phy			*dphy;
+	struct csi2rx_vops		*vops;
 
 	u8				lanes[CSI2RX_LANES_MAX];
 	u8				num_lanes;
@@ -92,6 +105,32 @@ struct csi2rx_priv *v4l2_subdev_to_csi2rx(struct v4l2_subdev *subdev)
 	return container_of(subdev, struct csi2rx_priv, subdev);
 }
 
+static void csi2rx_get_dev_cfg(struct csi2rx_priv *csi2rx)
+{
+	u32 dev_cfg;
+
+	clk_prepare_enable(csi2rx->p_clk);
+	dev_cfg = readl(csi2rx->base + CSI2RX_DEVICE_CFG_REG);
+	clk_disable_unprepare(csi2rx->p_clk);
+
+	csi2rx->max_lanes = dev_cfg & 7;
+	csi2rx->max_streams = (dev_cfg >> 4) & 7;
+	csi2rx->has_internal_dphy = dev_cfg & BIT(3) ? true : false;
+}
+
+static void csi2rx_v2_get_dev_cfg(struct csi2rx_priv *csi2rx)
+{
+	u32 dev_cfg;
+
+	clk_prepare_enable(csi2rx->p_clk);
+	dev_cfg = readl(csi2rx->base + CSI2RX_DEVICE_CFG_REG);
+	clk_disable_unprepare(csi2rx->p_clk);
+
+	csi2rx->max_lanes = dev_cfg & 0xF;
+	csi2rx->max_streams = (dev_cfg >> 5) & 0xF;
+	csi2rx->has_internal_dphy = dev_cfg & BIT(4) ? true : false;
+}
+
 static void csi2rx_reset(struct csi2rx_priv *csi2rx)
 {
 	writel(CSI2RX_SOFT_RESET_PROTOCOL | CSI2RX_SOFT_RESET_FRONT,
@@ -102,18 +141,21 @@ static void csi2rx_reset(struct csi2rx_priv *csi2rx)
 	writel(0, csi2rx->base + CSI2RX_SOFT_RESET_REG);
 }
 
-static int csi2rx_start(struct csi2rx_priv *csi2rx)
+static void csi2rx_v2_reset(struct csi2rx_priv *csi2rx)
+{
+	writel(0, csi2rx->base + CSI2RX_V2_CORE_CTRL_REG);
+
+	udelay(10);
+
+	writel(CSI2RX_V2_CORE_CTRL_START,
+	       csi2rx->base + CSI2RX_V2_CORE_CTRL_REG);
+}
+
+static void csi2rx_map_static(struct csi2rx_priv *csi2rx)
 {
 	unsigned int i;
 	unsigned long lanes_used = 0;
 	u32 reg;
-	int ret;
-
-	ret = clk_prepare_enable(csi2rx->p_clk);
-	if (ret)
-		return ret;
-
-	csi2rx_reset(csi2rx);
 
 	reg = csi2rx->num_lanes << 8;
 	for (i = 0; i < csi2rx->num_lanes; i++) {
@@ -135,6 +177,32 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 	}
 
 	writel(reg, csi2rx->base + CSI2RX_STATIC_CFG_REG);
+}
+
+static void csi2rx_v2_map_static(struct csi2rx_priv *csi2rx)
+{
+	u32 reg;
+
+	reg = csi2rx->num_lanes << 4;
+	writel(reg, csi2rx->base + CSI2RX_STATIC_CFG_REG);
+}
+
+static int csi2rx_start(struct csi2rx_priv *csi2rx)
+{
+	unsigned int i;
+	int ret;
+
+	ret = clk_prepare_enable(csi2rx->p_clk);
+	if (ret)
+		return ret;
+
+	if (csi2rx->vops) {
+		if (csi2rx->vops->reset)
+			csi2rx->vops->reset(csi2rx);
+
+		if (csi2rx->vops->map_static)
+			csi2rx->vops->map_static(csi2rx);
+	}
 
 	ret = v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, true);
 	if (ret)
@@ -282,7 +350,6 @@ static int csi2rx_get_resources(struct csi2rx_priv *csi2rx,
 {
 	struct resource *res;
 	unsigned char i;
-	u32 dev_cfg;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	csi2rx->base = devm_ioremap_resource(&pdev->dev, res);
@@ -316,26 +383,25 @@ static int csi2rx_get_resources(struct csi2rx_priv *csi2rx,
 		return -EINVAL;
 	}
 
-	clk_prepare_enable(csi2rx->p_clk);
-	dev_cfg = readl(csi2rx->base + CSI2RX_DEVICE_CFG_REG);
-	clk_disable_unprepare(csi2rx->p_clk);
+	if (csi2rx->vops && csi2rx->vops->get_dev_cfg) {
+		csi2rx->vops->get_dev_cfg(csi2rx);
+	} else {
+		dev_err(&pdev->dev, "Couldn't get device configuration\n");
+		return -EINVAL;
+	}
 
-	csi2rx->max_lanes = dev_cfg & 7;
 	if (csi2rx->max_lanes > CSI2RX_LANES_MAX) {
 		dev_err(&pdev->dev, "Invalid number of lanes: %u\n",
 			csi2rx->max_lanes);
 		return -EINVAL;
 	}
 
-	csi2rx->max_streams = (dev_cfg >> 4) & 7;
 	if (csi2rx->max_streams > CSI2RX_STREAMS_MAX) {
 		dev_err(&pdev->dev, "Invalid number of streams: %u\n",
 			csi2rx->max_streams);
 		return -EINVAL;
 	}
 
-	csi2rx->has_internal_dphy = dev_cfg & BIT(3) ? true : false;
-
 	/*
 	 * FIXME: Once we'll have internal D-PHY support, the check
 	 * will need to be removed.
@@ -426,9 +492,39 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
 	return ret;
 }
 
+static const struct csi2rx_vops csi2rx_vops = {
+	.get_dev_cfg = csi2rx_get_dev_cfg,
+	.reset = csi2rx_reset,
+	.map_static = csi2rx_map_static
+};
+
+static const struct csi2rx_vops csi2rx_v2_vops = {
+	.get_dev_cfg = csi2rx_v2_get_dev_cfg,
+	.reset = csi2rx_v2_reset,
+	.map_static = csi2rx_v2_map_static
+};
+
+static const struct of_device_id csi2rx_of_table[] = {
+	{
+		.compatible = "cdns,csi2rx",
+		.data = &csi2rx_vops
+	},
+	{
+		.compatible = "cdns,csi2rx-1.3",
+		.data = &csi2rx_vops
+	},
+	{
+		.compatible = "cdns,csi2rx-2.1",
+		.data = &csi2rx_v2_vops
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, csi2rx_of_table);
+
 static int csi2rx_probe(struct platform_device *pdev)
 {
 	struct csi2rx_priv *csi2rx;
+	const struct of_device_id *of_id;
 	unsigned int i;
 	int ret;
 
@@ -439,6 +535,9 @@ static int csi2rx_probe(struct platform_device *pdev)
 	csi2rx->dev = &pdev->dev;
 	mutex_init(&csi2rx->lock);
 
+	of_id = of_match_node(csi2rx_of_table, pdev->dev.of_node);
+	csi2rx->vops = (struct csi2rx_vops *)of_id->data;
+
 	ret = csi2rx_get_resources(csi2rx, pdev);
 	if (ret)
 		goto err_free_priv;
@@ -493,12 +592,6 @@ static int csi2rx_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id csi2rx_of_table[] = {
-	{ .compatible = "cdns,csi2rx" },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, csi2rx_of_table);
-
 static struct platform_driver csi2rx_driver = {
 	.probe	= csi2rx_probe,
 	.remove	= csi2rx_remove,
-- 
2.15.0

