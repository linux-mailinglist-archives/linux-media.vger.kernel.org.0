Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48DCD74B83
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 12:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbfGYK1L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 06:27:11 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:11150 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726347AbfGYK1L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 06:27:11 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6PAQusE025687;
        Thu, 25 Jul 2019 03:27:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=QlZU3SH+FmXy2LnCv7NwSRbl7gVHx6xbWKrzugFHtT4=;
 b=URvX8OREEuuxUr0QS4bA1iV40xL9mOc8/5XzIY3Un6u1yI7emwEon4G7OUwwv5JgLBhY
 W10EU8QJ0zE8iKLeN6fzcIVbJdS2WO7foHLo2OmgcFQT1wgoL5uSClHpEG9XQA73Og4u
 VixO9xRB61mVmN01t2ge/SzBfh1zg45Ai/fYC2Ta7Sd9xZA58RBNxllbPfT+CTzzMvKV
 bNEerDKTQPc1bXRClODQNOG7B8ho9eHZyl1PCRX/7y1a1oY7aeJYgSrVHL72gvsL6UFo
 47aSMUs8Z+q5zS8NjUhJYBvDwS0g7ch1S+oFn+wUbHkJ3dxbMUtfVCF1U4F8/6x+UDR/ rA== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam04-co1-obe.outbound.protection.outlook.com (mail-co1nam04lp2053.outbound.protection.outlook.com [104.47.45.53])
        by mx0a-0014ca01.pphosted.com with ESMTP id 2ty9h4g7nb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Jul 2019 03:27:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCLXdMysnjumS/X4M6qZEO3pjxOVvEFclDt/GiycKl3sHpckcJU+ilNsdIAWGeZn0RazsRsruG9YCDd1rB9bCBxzSp0JsXRJ9y3a0q+N+F4OZCntR1m/T/lzah0Sc+iVqbWsVWsNN2SpHprFxniqgM5vH8q/Cn9df3bP9wtunAxTNtpXmbTpCzOZeCJzhTq2jLAxISHTo7/zNqCRsueHDAdi40eNW0k4tlRh5TbX7nqk8tI5XnRMrivbSBuIct+MOeI1eEAYqOPiUPn820hu+M8gITLK5SIEXnkEh074Gc+OwZZa//+tUqRqAl96Jw+aEFXYSsUaVTb0svvIsLuAnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlZU3SH+FmXy2LnCv7NwSRbl7gVHx6xbWKrzugFHtT4=;
 b=QzcFEFuNPX5EJLJM8MOgGxnjvRcHDk/SyqvzFZesjY8x8cEjJ8br1vo518COplovwVk7xj4GMgtZCYTllupymVdWoQC+KBhL3xJbORQ2a2E6+2w3PLjpISXPApVI3iEyXaqHyBNH0n9cAVY9o0jhQLEZ/kjsjGouaPtMpO2R8l5pXjyVdOrWN+Q2BisIC7BYsbF3EiD9ZvaogTo9DHiS9R9mxVEne+sToA404aMjdLg/j3340RfKO/9HVPfT9p/eJdoGQnQHMCZ2QjR67BmeLS/+6XpZZyv6RKG3jUzeH6SbIqSD/4dafgpLDKiMnwlFzd9TIddXlGKq1ggPv0Kq0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=softfail (sender ip is
 158.140.1.28) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=cadence.com;dmarc=fail (p=none sp=none pct=100) action=none
 header.from=cadence.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlZU3SH+FmXy2LnCv7NwSRbl7gVHx6xbWKrzugFHtT4=;
 b=EISbb+ySGTX9rs2dg9qxSTZcJXXJoP1i0qwwigKjjBQ6ZbU6+czRIx0tOlrNZLp3m1rMM48INWI5zbME87BODdZPIca5nBp57kVYC3ajKEIDmaiRCpkepQdQEu0ZglSkXGoflqoQzyAS+D8Fsgjm0Izt80PQqFwzAMLl9ye3M+Y=
Received: from SN4PR0701CA0018.namprd07.prod.outlook.com
 (2603:10b6:803:28::28) by DM6PR07MB6828.namprd07.prod.outlook.com
 (2603:10b6:5:159::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.10; Thu, 25 Jul
 2019 10:27:00 +0000
Received: from CO1NAM05FT028.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::208) by SN4PR0701CA0018.outlook.office365.com
 (2603:10b6:803:28::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.12 via Frontend
 Transport; Thu, 25 Jul 2019 10:27:00 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 CO1NAM05FT028.mail.protection.outlook.com (10.152.96.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.7 via Frontend Transport; Thu, 25 Jul 2019 10:26:59 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x6PAQsW2025529
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Thu, 25 Jul 2019 03:26:58 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 25 Jul 2019 12:26:52 +0200
Received: from lvloginb.cadence.com (10.165.177.11) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 25 Jul 2019 12:26:51 +0200
Received: from lvloginb.cadence.com (localhost [127.0.0.1])
        by lvloginb.cadence.com (8.14.4/8.14.4) with ESMTP id x6PAQqpl013596;
        Thu, 25 Jul 2019 11:26:52 +0100
Received: (from jank@localhost)
        by lvloginb.cadence.com (8.14.4/8.14.4/Submit) id x6PAQpl9013595;
        Thu, 25 Jul 2019 11:26:51 +0100
From:   Jan Kotas <jank@cadence.com>
To:     <maxime.ripard@bootlin.com>, <mchehab@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <rafalc@cadence.com>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jan Kotas <jank@cadence.com>
Subject: [PATCH 3/3] media: Add support for Cadence CSI2RX 2.1
Date:   Thu, 25 Jul 2019 11:26:48 +0100
Message-ID: <20190725102648.13445-4-jank@cadence.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20190725102648.13445-1-jank@cadence.com>
References: <20190725102648.13445-1-jank@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28;IPV:CAL;SCL:-1;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(396003)(2980300002)(199004)(189003)(36092001)(54906003)(110136005)(16586007)(42186006)(246002)(316002)(446003)(36756003)(76176011)(14444005)(51416003)(126002)(2616005)(486006)(186003)(476003)(1076003)(8676002)(8936002)(356004)(336012)(478600001)(86362001)(47776003)(50226002)(107886003)(426003)(11346002)(2906002)(26826003)(305945005)(70586007)(50466002)(70206006)(26005)(7636002)(48376002)(76130400001)(87636003)(5660300002)(6666004)(4326008)(2101003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR07MB6828;H:sjmaillnx1.cadence.com;FPR:;SPF:SoftFail;LANG:en;PTR:corp.Cadence.COM;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c10de8b-7d78-4a61-d500-08d710eaa090
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);SRVR:DM6PR07MB6828;
X-MS-TrafficTypeDiagnostic: DM6PR07MB6828:
X-Microsoft-Antispam-PRVS: <DM6PR07MB6828A726051F7FB3A11F0FEAD0C10@DM6PR07MB6828.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-Forefront-PRVS: 0109D382B0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /8jIYikmZdehrT/jGmX0KLagz0x93jm1DtBhaZOUw8Eru/kKpzSJ2ll1EZ+3sG8iupvwaaY8SsnFASiNGqgtmrjZOAxjYgOa3o81l9urcypEbdV8Z7dwIGSkKjgnl9v5kCX6Es+iT3lTkT9Vw7UueqBB3ZesithUFvglauJwQM6tubiouHiUk4cO3WxvqJJwqLqPvj8+vOAlioLH5BiN5VRCq21+DxCT6t9xeqspCkCqyKIkZ0+bCJQmSHx413vvgZMB0Upz3h8EsdF6pJGqq6X847k78xY7LSb4mahvTfJBmJGAo9RLMTy/PNPK0inF8a2G6NntYqwrKGpELbSN8Dp4QWcORBeACC0xnAQfzNz3RAVHyZpqzIw0DwXIs4gXq4N5R2++3/GcShHRtQSqfodroAXQT+hqwDQEPRxkwus=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2019 10:26:59.6040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c10de8b-7d78-4a61-d500-08d710eaa090
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[158.140.1.28];Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6828
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-25_04:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0
 priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907250126
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds support for CSI2RX v2.1 version of the controller.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 137 ++++++++++++++++++++++-----
 1 file changed, 115 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 97ec09e72..4c76c6490 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
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

