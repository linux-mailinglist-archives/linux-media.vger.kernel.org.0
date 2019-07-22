Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 078246FB30
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 10:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728352AbfGVIXc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 04:23:32 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:30280 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727092AbfGVIXb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 04:23:31 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6M8EidU005904;
        Mon, 22 Jul 2019 01:23:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=lHz4Q4K/yjO///EvYs/rUyYKz+CEl2fjKefxKqo+yfk=;
 b=IS0mjXwS9UyeXTr5qAR9IBG9pTZeKWxdEfg9Syuk/9iDL0XyNFSe1hEGD//Qt+e4Pl3/
 JUTDckXsnmrKm+J1YxieyKAWthoP/t8U71CxKDqqBB3H2dJqM/eEQJI0ZtTxlBXdN4XE
 wJUgkyuWbDB0v4Mrb1CplRorkEnQf+gawYglUA3/D7gRCujh2Q31Iy1y4Yw2U7TaeLZR
 8+8scFIrWp349lG8LjjOOmAH8t18/0op23j3qxqiNnoPElgLv1nZbatQT5OkFSfbLMTw
 8j3Vnq4dIHXxerPTXmQDcf9hykJDDTE0ZJ9DJXZFUIiBCji7v8Z2sfrkG/7LfaB3P3Ml LA== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam01-by2-obe.outbound.protection.outlook.com (mail-by2nam01lp2050.outbound.protection.outlook.com [104.47.34.50])
        by mx0b-0014ca01.pphosted.com with ESMTP id 2tuxhwe238-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Mon, 22 Jul 2019 01:23:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1w+39YwLWO7v2HfJP6ksnET7cP6IRi8OtQQPpv7jRjnBwLN2ySuVlEkvpFJgcGA0HJvxjOwvliYy2yi0lkO+LexC+3i7f4wl38z4rT8xptOZfhNiSqlvGvz1WXZvXMyEH/1BNh5RWKKyj37n8UAwg2BoGDtJ2SONJdnzAutKf427lNnuxmIDVFCn6rKhq+hEw7LVjxxElWzSZnwviZPyOH5e5RHSxO2uXbiqEFOw8bn5Vd9mcaBHtp61V3Q+BfD0ppA9FV7Hae+O4Rqtc97cQ9EuP/TQGq3hmZvcZ3Us540yxi6XxoI6Cne4mWIwWF632Sb759+vqK9VVGndXIrjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHz4Q4K/yjO///EvYs/rUyYKz+CEl2fjKefxKqo+yfk=;
 b=AG61MWDjtMrTJduqq58EluWVFuVMk2ycdSz/9nGgKJ5P4LiPlt5aAKeE9A0b3FdwqiPOmqsV1Q2HzAXKSR4Aw+i3+BQ6f0RA4pV78V2h0IrPOzlZSRAH4WTOstTmsUqsTdD3CuQ2ovFG3qtX9xbcTXRINolBHkhgvP6Hny7W2YjY5EnhnjAn6m3YmOaa3ECeVJAm/yZYrFIdRBRxrzEpelu0GRyBetMlm3xLck+F+K9gXdoMKkUcPnGdt4ciGAZ53nkte9BIdLcBW4x9yokDiNCAKRwKujUUybzXdpcacL+cNDy5NLMgJcC2XDGH4QKaViVskO+G41WlnjLZov596Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=softfail (sender ip is
 199.43.4.28) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=cadence.com;dmarc=fail (p=none sp=none pct=100) action=none
 header.from=cadence.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHz4Q4K/yjO///EvYs/rUyYKz+CEl2fjKefxKqo+yfk=;
 b=sbutvre8HU3wcRSqb/l7kcevBux8GAE0yBO2qVjkpLmjR5Hi/ybK3RoMNJzls6pa+nwbToD6jaQAi636WZgj55w3v3DbAku11FZr2es5SOA0k2N5CFzGuSp3/X/7I4oSJIND3B/8p7kHCKPFr9gcF6Rv5gKNa7jt78rJheWa2e8=
Received: from BYAPR07CA0088.namprd07.prod.outlook.com (2603:10b6:a03:12b::29)
 by CH2PR07MB6520.namprd07.prod.outlook.com (2603:10b6:610:25::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 22 Jul
 2019 08:23:19 +0000
Received: from CO1NAM05FT040.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::202) by BYAPR07CA0088.outlook.office365.com
 (2603:10b6:a03:12b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16 via Frontend
 Transport; Mon, 22 Jul 2019 08:23:19 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 CO1NAM05FT040.mail.protection.outlook.com (10.152.96.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.4 via Frontend Transport; Mon, 22 Jul 2019 08:23:18 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x6M8N8DD007762
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Mon, 22 Jul 2019 04:23:16 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 22 Jul 2019 10:23:08 +0200
Received: from lvloginb.cadence.com (10.165.177.11) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 22 Jul 2019 10:23:08 +0200
Received: from lvloginb.cadence.com (localhost [127.0.0.1])
        by lvloginb.cadence.com (8.14.4/8.14.4) with ESMTP id x6M8N8cl019025;
        Mon, 22 Jul 2019 09:23:08 +0100
Received: (from jank@localhost)
        by lvloginb.cadence.com (8.14.4/8.14.4/Submit) id x6M8N8NF019024;
        Mon, 22 Jul 2019 09:23:08 +0100
From:   Jan Kotas <jank@cadence.com>
To:     <maxime.ripard@bootlin.com>, <mchehab@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <rafalc@cadence.com>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jan Kotas <jank@cadence.com>
Subject: [PATCH v2 4/4] media: Add support for Cadence CSI2TX 2.1
Date:   Mon, 22 Jul 2019 09:22:23 +0100
Message-ID: <20190722082223.18693-5-jank@cadence.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20190722082223.18693-1-jank@cadence.com>
References: <20190722082223.18693-1-jank@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28;IPV:CAL;SCL:-1;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(2980300002)(36092001)(199004)(189003)(446003)(8676002)(2616005)(126002)(336012)(50226002)(476003)(81166006)(8936002)(42186006)(11346002)(81156014)(426003)(54906003)(316002)(70206006)(110136005)(186003)(305945005)(26005)(16586007)(48376002)(76176011)(2906002)(26826003)(36756003)(6666004)(76130400001)(53936002)(47776003)(356004)(1076003)(486006)(86362001)(107886003)(70586007)(50466002)(69596002)(5660300002)(87636003)(478600001)(68736007)(4326008)(51416003)(2101003);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR07MB6520;H:rmmaillnx1.cadence.com;FPR:;SPF:SoftFail;LANG:en;PTR:InfoDomainNonexistent;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7eda4d43-b9b6-4629-d81b-08d70e7dda03
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);SRVR:CH2PR07MB6520;
X-MS-TrafficTypeDiagnostic: CH2PR07MB6520:
X-Microsoft-Antispam-PRVS: <CH2PR07MB652007FDA34E0C3C9B6204D1D0C40@CH2PR07MB6520.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 01068D0A20
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rkLL1bHIwdknyxrJakLDxLGpLUi0Y+9yCMyjW9Og1CkgicvY6Xq5fGB6NSG6BLaeGxEtQpqsZE/Ynctc52MQUx0KKoyBVEYX/AfH6ES+BX6nUImGtzZxy12/W+T31KT4S2d417jhDLWAhSjf5dTTbfYjevoMU6LKb0Vc4FwYzkU3NBZQ+/40wh4jT1321pAtgwKOHUK6k22njjetUNLl0ma9qgTM/Bs2xrG4m/PyQbh0syR/cXnLKbN/B5Pcs9dzny3dhgjI/JtETlAJcWUjV4OAMrwVnnCsp6lRQtQoLYXlduKTmcCx5zDmVNCQTjWMJjrilfykLBULZPWA8MLL0yCDBp1DDSu6UyYY8+3FXA5ysFp6mEmqmTD9AEB/HBiPQocFqcmHAikgIPHfRwb6285B6kizCjUverKEhioAa3E=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2019 08:23:18.3897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eda4d43-b9b6-4629-d81b-08d70e7dda03
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[199.43.4.28];Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR07MB6520
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-22_07:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0
 priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907220100
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds support for CSI2TX v2.1 version of the controller.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 drivers/media/platform/cadence/cdns-csi2tx.c | 140 +++++++++++++++++++++------
 1 file changed, 111 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2tx.c b/drivers/media/platform/cadence/cdns-csi2tx.c
index c72c8a065..e4d08acfb 100644
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
@@ -209,29 +229,44 @@ static const struct v4l2_subdev_pad_ops csi2tx_pad_ops = {
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
@@ -239,23 +274,47 @@ static int csi2tx_start(struct csi2tx_priv *csi2tx)
 		reg |= CSI2TX_DPHY_CFG_LANE_RESET(csi2tx->lanes[i] - 1);
 	writel(reg, csi2tx->base + CSI2TX_DPHY_CFG_REG);
 
-	udelay(10);
+	csi2tx_dphy_init_finish(csi2tx, reg);
+}
 
-	/* Enable our (clock and data) lanes */
-	reg |= CSI2TX_DPHY_CFG_CLK_ENABLE;
-	for (i = 0; i < csi2tx->num_lanes; i++)
-		reg |= CSI2TX_DPHY_CFG_LANE_ENABLE(csi2tx->lanes[i] - 1);
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

