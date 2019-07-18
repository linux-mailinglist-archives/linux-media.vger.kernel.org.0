Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B62C6CD32
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2019 13:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390031AbfGRLPq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jul 2019 07:15:46 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:54062 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726665AbfGRLPl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jul 2019 07:15:41 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6IB4dt3015820;
        Thu, 18 Jul 2019 04:15:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=qBCdHWi5ZY2oOZDt9gutmPFJ9fOuA8bEFvu8kgu55aw=;
 b=CruZoqk27jhcZs3ksZNxfl58KjvvBEFTXk4BPzkoQESLvaYlvM63J2mbfFMEONyk7UlS
 Rmq8AJ6K91peGlqctaoSP9KGcE57zD3HK2SJ66f/9mh5GD8nxaGBUZHQA0ENh55mjgFB
 XyqyI3mVCAUSoWabbVoalHLkNSmb7bveRlTnZQb4aVOamg4AJ1yVMztpoxmDsIebW/gb
 ub+d3XfW5sQh6wgfJHbKePmg9vvMQ7QlPcNBdo9V3wSR6JwZ4x3qF3ZCdrPimJMPDoxF
 vz4BXVrqX9rRYUR6nVr73awzeALlP9FgGtyqHhWwI1wZz8tzXNDk4CR5V8akiKTeIi7M dw== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam05-by2-obe.outbound.protection.outlook.com (mail-by2nam05lp2057.outbound.protection.outlook.com [104.47.50.57])
        by mx0b-0014ca01.pphosted.com with ESMTP id 2tqavwv1su-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Thu, 18 Jul 2019 04:15:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLrLsFAqpmsfQCgPuUmpjQ9BQop52qGMWkmjeUZBoxnPWjr5hvQuxt31UZANhI+B6FBx//oHrWNmiCt4hKGu/Lj7/NMOLUCBVdgYBHhgA6G/R6Pam4wQbs9BDBzTER1Mcl0s6QQhUUrYlD0sWnI8N+8EZXBhRZl7oM8eOl86SR+S7A44bby4f3tFeMOZuFk/lSwz79QEMiuNSnM/JYhsK9nsogPzA329iBxh/nhU7jUH9gnIG+S+fEbx+T+7ZyzEnr4OlmwBVznc8bRMpz8wH5tltaVy26W33ltgmTzr/+IoK9heoLEyYGfBZv7mussZ4OQbZwzEq1gWhynL3SAEnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBCdHWi5ZY2oOZDt9gutmPFJ9fOuA8bEFvu8kgu55aw=;
 b=UGznZI/B+YDuUVu9RFUNdV/gTf1lvd/lY/dAOLd02HGMX43lFBgOZora9Z7RAY3HaJ4uCIwa3WxE0NWsUYpSWza3VNEWHscFAIqrshhuruCiSkslZO5buw7ZQFuUI/yz7nnbRtpBWjcIIVDrKrF8I4755vRpj6yHfhLC+6whT2nw+UyMFn3vpgALYZH1r3VNsaH5SBKEzyCbR6u8gpgslxF+o0o98wEM+HdYyac/+Wf9oQgcxW2PkhOY9xl6Yd7rYME5iRUotQgnxKXulNHeJ7pZfIShl+za2NOhmNd+bYhBoNOg/WQAQUZ5lzBqfgvd6Ga1hANpAjblmV7eZJuLXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=softfail (sender ip is
 158.140.1.28) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=cadence.com;dmarc=fail (p=none sp=none pct=100) action=none
 header.from=cadence.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBCdHWi5ZY2oOZDt9gutmPFJ9fOuA8bEFvu8kgu55aw=;
 b=hM8Vs6RClq6fsgC3I/YHG4XfhwZTYP1kz0vq5SrVMlEpvbgUpYLNY+4iJKPQYHOfFWeAnvIWoHLB/UUR32ClIqAf1FBNrpsDL/Q+3dmUR/Pdu/35yPIIHbImbOucJDgM02iyWdOt9ofCEfirrCZZ/0Jj6C4KcRtKZWiLY0TbItY=
Received: from MN2PR07CA0029.namprd07.prod.outlook.com (2603:10b6:208:1a0::39)
 by BYAPR07MB4791.namprd07.prod.outlook.com (2603:10b6:a02:f0::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Thu, 18 Jul
 2019 11:15:27 +0000
Received: from BY2NAM05FT010.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::208) by MN2PR07CA0029.outlook.office365.com
 (2603:10b6:208:1a0::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.12 via Frontend
 Transport; Thu, 18 Jul 2019 11:15:26 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 BY2NAM05FT010.mail.protection.outlook.com (10.152.100.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.4 via Frontend Transport; Thu, 18 Jul 2019 11:15:26 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id x6IBFMvF021080
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Thu, 18 Jul 2019 04:15:25 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 18 Jul 2019 13:15:22 +0200
Received: from lvloginb.cadence.com (10.165.177.11) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 18 Jul 2019 13:15:22 +0200
Received: from lvloginb.cadence.com (localhost [127.0.0.1])
        by lvloginb.cadence.com (8.14.4/8.14.4) with ESMTP id x6IBFLid030014;
        Thu, 18 Jul 2019 12:15:21 +0100
Received: (from jank@localhost)
        by lvloginb.cadence.com (8.14.4/8.14.4/Submit) id x6IBFL4C030013;
        Thu, 18 Jul 2019 12:15:21 +0100
From:   Jan Kotas <jank@cadence.com>
To:     <maxime.ripard@bootlin.com>, <mchehab@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jan Kotas <jank@cadence.com>
Subject: [PATCH 3/3] media: Add support for Cadence CSI2TX 2.1
Date:   Thu, 18 Jul 2019 12:15:09 +0100
Message-ID: <20190718111509.29924-4-jank@cadence.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20190718111509.29924-1-jank@cadence.com>
References: <20190718111509.29924-1-jank@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28;IPV:CAL;SCL:-1;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(2980300002)(36092001)(199004)(189003)(2616005)(486006)(107886003)(11346002)(476003)(126002)(246002)(76176011)(2906002)(186003)(26826003)(16586007)(51416003)(87636003)(47776003)(316002)(8676002)(4326008)(426003)(42186006)(8936002)(6666004)(336012)(86362001)(48376002)(50466002)(446003)(54906003)(110136005)(70206006)(26005)(70586007)(478600001)(50226002)(7636002)(5660300002)(305945005)(36756003)(1076003)(76130400001)(356004)(2101003);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR07MB4791;H:sjmaillnx2.cadence.com;FPR:;SPF:SoftFail;LANG:en;PTR:corp.Cadence.COM;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f0e5f47-8a95-49e4-2d73-08d70b713c27
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);SRVR:BYAPR07MB4791;
X-MS-TrafficTypeDiagnostic: BYAPR07MB4791:
X-Microsoft-Antispam-PRVS: <BYAPR07MB47912276CA81F46F79987EBCD0C80@BYAPR07MB4791.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 01026E1310
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: O5+6MevBRcE3uQqXPB7arwfrzHltEW+SLOGMwfP5NC74wzTe1y4UD9CPjWcn8D4ZBKVB0OdNdlffoS2D913rnhMCbgSn9yCBwXFhkrZer/rS3Bx9BaoBlRpOVahKcEfrxwC1fWIHaRhmYn/ksyAXWd+bPrBdEHXtRTJIk2EAj/jIBYuvGnw9EqacgvRvu+hW4d+xjFy0MddvEF4pgVpsJclgoCUfpSAPqCoOEKzaxyvPX2oQsccbtYqwb6yWgqqj60Gr5JBpmS6K1No4wAPvfIIKQxPeeJTZ5yujcJiIDtTDVpE2v7EW66aiuMXGJQ2XgXz8D0zMtWLTuObKb44IVQsUSoATEpdSryQumRJyj5QHZJcDVOIg3m3WMti0MrRNr3CGdvNWGy+NZsdMmy7+UxKZrU97zZyOIBKEBiGLLlI=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2019 11:15:26.4024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f0e5f47-8a95-49e4-2d73-08d70b713c27
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[158.140.1.28];Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB4791
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-18_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0
 priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907180122
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds support for CSI2TX v2.1 version of the controller.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 drivers/media/platform/cadence/cdns-csi2tx.c | 142 +++++++++++++++++++++------
 1 file changed, 112 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2tx.c b/drivers/media/platform/cadence/cdns-csi2tx.c
index 232259c71..e4d08acfb 100644
--- a/drivers/media/platform/cadence/cdns-csi2tx.c
+++ b/drivers/media/platform/cadence/cdns-csi2tx.c
@@ -52,6 +52,17 @@
 #define CSI2TX_STREAM_IF_CFG_REG(n)	(0x100 + (n) * 4)
 #define CSI2TX_STREAM_IF_CFG_FILL_LEVEL(n)	((n) & 0x1f)
 
+/* CSI2TX V2 Registers */
+#define CSI2TX_V2_DPHY_CFG_REG			0x28
+#define CSI2TX_V2_DPHY_CFG_RESET		BIT(16)
+#define CSI2TX_V2_DPHY_CFG_CLOCK_MODE		BIT(10)
+#define CSI2TX_V2_DPHY_CFG_MODE_MASK		GENMASK(9, 8)
+#define CSI2TX_V2_DPHY_CFG_MODE_LPDT		(2 << 8)
+#define CSI2TX_V2_DPHY_CFG_MODE_HS		(1 << 8)
+#define CSI2TX_V2_DPHY_CFG_MODE_ULPS		(0 << 8)
+#define CSI2TX_V2_DPHY_CFG_CLK_ENABLE		BIT(4)
+#define CSI2TX_V2_DPHY_CFG_LANE_ENABLE(n)	BIT(n)
+
 #define CSI2TX_LANES_MAX	4
 #define CSI2TX_STREAMS_MAX	4
 
@@ -70,6 +81,13 @@ struct csi2tx_fmt {
 	u32	bpp;
 };
 
+struct csi2tx_priv;
+
+/* CSI2TX Variant Operations */
+struct csi2tx_vops {
+	void (*dphy_setup)(struct csi2tx_priv *csi2tx);
+};
+
 struct csi2tx_priv {
 	struct device			*dev;
 	unsigned int			count;
@@ -82,6 +100,8 @@ struct csi2tx_priv {
 
 	void __iomem			*base;
 
+	struct csi2tx_vops		*vops;
+
 	struct clk			*esc_clk;
 	struct clk			*p_clk;
 	struct clk			*pixel_clk[CSI2TX_STREAMS_MAX];
@@ -209,53 +229,92 @@ static const struct v4l2_subdev_pad_ops csi2tx_pad_ops = {
 	.set_fmt	= csi2tx_set_pad_format,
 };
 
-static void csi2tx_reset(struct csi2tx_priv *csi2tx)
+/* Set Wake Up value in the D-PHY */
+static void csi2tx_dphy_set_wakeup(struct csi2tx_priv *csi2tx)
 {
-	writel(CSI2TX_CONFIG_SRST_REQ, csi2tx->base + CSI2TX_CONFIG_REG);
-
-	udelay(10);
+	writel(CSI2TX_DPHY_CLK_WAKEUP_ULPS_CYCLES(32),
+	       csi2tx->base + CSI2TX_DPHY_CLK_WAKEUP_REG);
 }
 
-static int csi2tx_start(struct csi2tx_priv *csi2tx)
+/*
+ * Finishes the D-PHY initialization
+ * reg dphy cfg value to be used
+ */
+static void csi2tx_dphy_init_finish(struct csi2tx_priv *csi2tx, u32 reg)
 {
-	struct media_entity *entity = &csi2tx->subdev.entity;
-	struct media_link *link;
 	unsigned int i;
-	u32 reg;
 
-	csi2tx_reset(csi2tx);
+	udelay(10);
 
-	writel(CSI2TX_CONFIG_CFG_REQ, csi2tx->base + CSI2TX_CONFIG_REG);
+	/* Enable our (clock and data) lanes */
+	reg |= CSI2TX_DPHY_CFG_CLK_ENABLE;
+	for (i = 0; i < csi2tx->num_lanes; i++)
+		reg |= CSI2TX_DPHY_CFG_LANE_ENABLE(csi2tx->lanes[i] - 1);
+	writel(reg, csi2tx->base + CSI2TX_DPHY_CFG_REG);
 
 	udelay(10);
 
-	/* Configure our PPI interface with the D-PHY */
-	writel(CSI2TX_DPHY_CLK_WAKEUP_ULPS_CYCLES(32),
-	       csi2tx->base + CSI2TX_DPHY_CLK_WAKEUP_REG);
+	/* Switch to HS mode */
+	reg &= ~CSI2TX_DPHY_CFG_MODE_MASK;
+	writel(reg | CSI2TX_DPHY_CFG_MODE_HS,
+	       csi2tx->base + CSI2TX_DPHY_CFG_REG);
+}
+
+/* Configures D-PHY in CSIv1.3 */
+static void csi2tx_dphy_setup(struct csi2tx_priv *csi2tx)
+{
+	u32 reg;
+	unsigned int i;
+
+	csi2tx_dphy_set_wakeup(csi2tx);
 
 	/* Put our lanes (clock and data) out of reset */
 	reg = CSI2TX_DPHY_CFG_CLK_RESET | CSI2TX_DPHY_CFG_MODE_LPDT;
 	for (i = 0; i < csi2tx->num_lanes; i++)
-		reg |= CSI2TX_DPHY_CFG_LANE_RESET(csi2tx->lanes[i]);
+		reg |= CSI2TX_DPHY_CFG_LANE_RESET(csi2tx->lanes[i] - 1);
 	writel(reg, csi2tx->base + CSI2TX_DPHY_CFG_REG);
 
-	udelay(10);
+	csi2tx_dphy_init_finish(csi2tx, reg);
+}
 
-	/* Enable our (clock and data) lanes */
-	reg |= CSI2TX_DPHY_CFG_CLK_ENABLE;
-	for (i = 0; i < csi2tx->num_lanes; i++)
-		reg |= CSI2TX_DPHY_CFG_LANE_ENABLE(csi2tx->lanes[i]);
-	writel(reg, csi2tx->base + CSI2TX_DPHY_CFG_REG);
+/* Configures D-PHY in CSIv2 */
+static void csi2tx_v2_dphy_setup(struct csi2tx_priv *csi2tx)
+{
+	u32 reg;
+
+	csi2tx_dphy_set_wakeup(csi2tx);
+
+	/* Put our lanes (clock and data) out of reset */
+	reg = CSI2TX_V2_DPHY_CFG_RESET | CSI2TX_V2_DPHY_CFG_MODE_LPDT;
+	writel(reg, csi2tx->base + CSI2TX_V2_DPHY_CFG_REG);
+
+	csi2tx_dphy_init_finish(csi2tx, reg);
+}
+
+static void csi2tx_reset(struct csi2tx_priv *csi2tx)
+{
+	writel(CSI2TX_CONFIG_SRST_REQ, csi2tx->base + CSI2TX_CONFIG_REG);
 
 	udelay(10);
+}
 
-	/* Switch to HS mode */
-	reg &= ~CSI2TX_DPHY_CFG_MODE_MASK;
-	writel(reg | CSI2TX_DPHY_CFG_MODE_HS,
-	       csi2tx->base + CSI2TX_DPHY_CFG_REG);
+static int csi2tx_start(struct csi2tx_priv *csi2tx)
+{
+	struct media_entity *entity = &csi2tx->subdev.entity;
+	struct media_link *link;
+	unsigned int i;
+
+	csi2tx_reset(csi2tx);
+
+	writel(CSI2TX_CONFIG_CFG_REQ, csi2tx->base + CSI2TX_CONFIG_REG);
 
 	udelay(10);
 
+	if (csi2tx->vops && csi2tx->vops->dphy_setup) {
+		csi2tx->vops->dphy_setup(csi2tx);
+		udelay(10);
+	}
+
 	/*
 	 * Create a static mapping between the CSI virtual channels
 	 * and the input streams.
@@ -478,9 +537,35 @@ static int csi2tx_check_lanes(struct csi2tx_priv *csi2tx)
 	return ret;
 }
 
+static const struct csi2tx_vops csi2tx_vops = {
+	.dphy_setup = csi2tx_dphy_setup,
+};
+
+static const struct csi2tx_vops csi2tx_v2_vops = {
+	.dphy_setup = csi2tx_v2_dphy_setup,
+};
+
+static const struct of_device_id csi2tx_of_table[] = {
+	{
+		.compatible = "cdns,csi2tx",
+		.data = &csi2tx_vops
+	},
+	{
+		.compatible = "cdns,csi2tx-1.3",
+		.data = &csi2tx_vops
+	},
+	{
+		.compatible = "cdns,csi2tx-2.1",
+		.data = &csi2tx_v2_vops
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, csi2tx_of_table);
+
 static int csi2tx_probe(struct platform_device *pdev)
 {
 	struct csi2tx_priv *csi2tx;
+	const struct of_device_id *of_id;
 	unsigned int i;
 	int ret;
 
@@ -495,6 +580,9 @@ static int csi2tx_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_free_priv;
 
+	of_id = of_match_node(csi2tx_of_table, pdev->dev.of_node);
+	csi2tx->vops = (struct csi2tx_vops *)of_id->data;
+
 	v4l2_subdev_init(&csi2tx->subdev, &csi2tx_subdev_ops);
 	csi2tx->subdev.owner = THIS_MODULE;
 	csi2tx->subdev.dev = &pdev->dev;
@@ -552,12 +640,6 @@ static int csi2tx_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id csi2tx_of_table[] = {
-	{ .compatible = "cdns,csi2tx" },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, csi2tx_of_table);
-
 static struct platform_driver csi2tx_driver = {
 	.probe	= csi2tx_probe,
 	.remove	= csi2tx_remove,
-- 
2.15.0

