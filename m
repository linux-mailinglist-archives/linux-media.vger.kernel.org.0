Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5550D73F45C
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 08:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbjF0GQL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 02:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbjF0GQE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 02:16:04 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E4DA2130;
        Mon, 26 Jun 2023 23:16:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idQ6M2a7WsFqh2BCBmyTYJfrW42IvAiNp3dWv+neHb+gQwkFGHRf1++7G1zs+TjW6430AKvpaYsOEXSBAfgax8PXYk0OxLjSnM28cft5+qtt2K8DH98p0Jz4sJpQpIPXFYlFv8OLK1zpaD6N/YinZxJl96uoq7JhADGxKsfSsMfXp3rGLnCNg86CUqGq7VFmtUTy/s+Z+r9TgSt9BPC2+/UlN7OF9qyXEMr3ug35XweDELAFKSkEMtc6C6jtW74R81A+g6VzF4x7LW42g5+jSSENRqexuBM7dzoZChA9d/6oRXMAq0t3NWE7wHvOXz59hn24ouoi1q2UuvyK/e6bQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEBbF8WWwTjsVMBwGVP7uSxbmtxBJgm1qBL4f5ekEaI=;
 b=j4UGJFtKntH82ufWyl3gN3Po+vBwJ+Z508JexvYFgeIcBz3g4+VYW6rm6Vdq0ieq7lL40quGwvEPGnBniVfz/U8gikMsZgLtk5CrN4rkP99Ea3lrO23j7VrtlECT3QYyXiVfx+bQ/D+R1CcGuN3XluflYG0MzPGYepm5Djp5nEofL7U6nuL1vQ8dlNBSxQv5xhdv4N2gXaADal1DjvuHiTLm3kzmYceEyh+4vUcb1TaoeSnbUWSGkrwp3OCNdCV6H2mLQU/nAoWe/XVgSfaMyX3duLiyqjEtglKyCo17mmJpjoLKtbdrgAVkMroECSBMIa59NMKhjFNrMK57QBcJfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEBbF8WWwTjsVMBwGVP7uSxbmtxBJgm1qBL4f5ekEaI=;
 b=HXfzvpebHFVtbeCOdoyeejIJcuTTvd4AOhpQ/UstgoThB7n0/5w7raOYEgmgnMcpSgpbWaLr1b09hUlM9nCTKXRd9cAvYQNPAsKp8WL36LYDJ/mOIYr1t/4BImSRqEJad6vbepEq7bLZ9SdiLQVHL9PLKphd82jUREuppW6DZzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DB8PR04MB7004.eurprd04.prod.outlook.com (2603:10a6:10:11c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Tue, 27 Jun
 2023 06:15:43 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6521.023; Tue, 27 Jun 2023
 06:15:43 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Subject: [PATCH v3 2/3] media: nxp: imx8-isi: move i.MX8 gasket configuration to an ops structure
Date:   Tue, 27 Jun 2023 14:20:16 +0800
Message-Id: <20230627062017.1135114-3-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230627062017.1135114-1-guoniu.zhou@oss.nxp.com>
References: <20230627062017.1135114-1-guoniu.zhou@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::18) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DB8PR04MB7004:EE_
X-MS-Office365-Filtering-Correlation-Id: c3ae004f-e36c-40d0-772b-08db76d5efd9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HCjvWZcog2Q8/ERfG08VpmApgytf0ZbQ6+yhlN1g1DZYf+GTfATDFdTEEqZBlVlrsmQppCM7Q+x0IikFLqAaALJ4U1Zvx38Cf2hOkQ8NMf+FwZW6XkPNculqqs8QZlyIw+duZ4yyuGp7imTei4RgejEY493GnsxiWbYaxyLAH5u86ErFkurCiXfTknE+7S7pFLECDYSLyTDzjq56QktUsYxVCWI0TzbLJGqoGaIWEc3IiRvli40VN1OJ9MMw2VOs9U9cci3UqFJujUB7MJC5MtYCbjZ5nkRGDYEhV3G2RWs8TvGJYOcD2VGkttrDDyzVW/Gf0htiQdD3T4FmFHRrTeeLCH9jxr8F2idZLTt5LrWWb0nXceRAnaEkX/eXm3H0nRZ2iNX5Nqv0FvJae0FGChyicGQIDc/WDDGCKAfze99QMEttGUYzQfzSWvMer2B2liqFM+WfkE07rGxwRiycofKgx9/2yZWOvR2cWoiJIia/tNA9tFzbGIzVgIbhmOk/CEXawAYxcS8ikVpi7WxmlD6iICe26L8qZP7Eypv+amna1a/fZ7KSYVbVhWLM2Anhp8V0JVGH49jJT7ZSP5IyEn13VkVoFs5+nx9UswblT8Cy0+NfxvpLq3zeCcf8r5cK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(451199021)(186003)(2906002)(26005)(1076003)(52116002)(38350700002)(2616005)(38100700002)(6512007)(6506007)(5660300002)(41300700001)(9686003)(66556008)(83380400001)(66476007)(66946007)(8936002)(8676002)(6666004)(7416002)(316002)(478600001)(86362001)(6486002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WDGN+zafHGr8vg1e0fSYnvXLR32OQehwUEvRRmJjZcxIHXaR6GMJCu01WqUT?=
 =?us-ascii?Q?794wBRknkRVjVGEWohuFJeOPCgsUjmjuhmewhUUsUVXhYmBJxgUsQPfOaoMh?=
 =?us-ascii?Q?P3f3f4UP2pHugT++MJ4zx5rYEVz+ujNFPVLpl8L70pPM9J86YrXdaiqGbnej?=
 =?us-ascii?Q?T1AIYePgBWY9fss5lrbu5z4cen6JEXMzDP8rlzWPK8303+ne7FzIvYw/0DYs?=
 =?us-ascii?Q?cBklLwSbyMLCzUSUEYjZLrkTRN0p8aKBZyHZNItl6phxLhUH6ZsGxmYQ2wrO?=
 =?us-ascii?Q?fI/+22mPbQZTDKVsNB/anOTbbtJ3zBdCSmoTx4Hv3YUoRueM8eQUdFcPm/aK?=
 =?us-ascii?Q?eaW/RXgLoDgntUIVGqDRs4wFIBT8qfHrWtWuYr7TwW32/cZe7M5VWN70u/q6?=
 =?us-ascii?Q?2x7R5+dB5nyWOx/8G7yFOaxj/jyZJoe1wMotGHqpJPnUGT7gom6QamAAiTtp?=
 =?us-ascii?Q?ITLSD9abWchOciMq7IodmFbz8LAAnXIkfuig/VJXrgpa4tKVe2EIhRBDGRfo?=
 =?us-ascii?Q?0/p0s9h3PHQdbnyb6TnamD24NlYz8vkShEBBuRMOhoSiTjZxjkYdA0JzidIo?=
 =?us-ascii?Q?zyNUBZurS0+Kfcd9lv3k86QyLLtjNysC2jEp0VTCx2ZCJ9zbxD84ikmj6ce/?=
 =?us-ascii?Q?Yx2jQ3UpZ1Q8FV9gM3O87CXaeqXa+ZjHesSJyU9+qZDS5UafdFZXLaIB+o9Z?=
 =?us-ascii?Q?dGOjFimA+Yde17XBOOzJGej+HtWDaZJY7vF8GIeHlGKtMQFMbSUNWjO35HnV?=
 =?us-ascii?Q?rm//uP8Ox9rZGQpZOWQ/5/qowqV0mqw2vdbDDHLwDJ+21s7cWiuBP7wRKi3N?=
 =?us-ascii?Q?X4N0dhgPq6mcFDIWwTNYjS/qPZwA8XmLaae+EB/jrWPwzyT9WwV2U7JbpCWa?=
 =?us-ascii?Q?o84fQKjo8jce9bOS6DzJ9Of3QyOKQGyqEJUn87hXAvHuV6KjyWMmscTX+R//?=
 =?us-ascii?Q?k0VcRWtlQrn7hUEMRgmYdIDG+qCfJ80iqBUTcXZjjHJnE+183ttJGiq/JUf0?=
 =?us-ascii?Q?8k04uPOAGHnXSLadQIBCMROqXQGdtx+mPjoHdO4FgYwoAM1s+bq7b7k/Yebt?=
 =?us-ascii?Q?I74HjWdEZVfk0wkY8tXOpTegztPljySWrFWUTOzSJTDUSdYZ9QJLgmQHiqo6?=
 =?us-ascii?Q?Mv99tC32XO5EgRHVFme8xbH2tAqDfJeUQdTDNCjw4o6V0oKWj2B4yvRkQuuB?=
 =?us-ascii?Q?8wkbS3ax7rVUBvJGuZDra3+kEYxALs8BdMof3W8CHWZ+/j7hQqItegXGZGdX?=
 =?us-ascii?Q?RhDFcs0J5psYMSTNs7lYj9loML2YqbRHlDD09TXlqPhWQ77azYerJS3d7BOs?=
 =?us-ascii?Q?aGZYbq4vKDh5jJdGWCt0G3QE4R9wQXR3SeGw9UCQHsnMM3MzAvDHqHkWqesC?=
 =?us-ascii?Q?FlNPxt3Wvsa5SJ0133bjXxpnCIN+I+pYB9Ib57dNtFQbQtsB9V3gtU13Lfx0?=
 =?us-ascii?Q?PKEw8UA5FpK7j/hwF3vl6fgi0bs83+99AZuKikZRplJEO9lbeooFQMUKsrw6?=
 =?us-ascii?Q?W8q4/mz3DAe16t+8OFwtqxfMIOM1PdBpwp8hWVNngTRLiLAIZaCJNUwzfBja?=
 =?us-ascii?Q?dwp15ec9y2Pf999oLRJp6jwJ4Kw2a+c95tu707Rd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ae004f-e36c-40d0-772b-08db76d5efd9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 06:15:42.9897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DtiDkAEWvR5SgJcst8F7eqE/RFxOPLytAh4DsxQ9LO7Q/v8gapzaNfiiuI0WkG7r6WZv8hNX5JuFerKKeYbW5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7004
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Move i.MX8MN and i.MX8MP gasket configuration to an ops structure.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/Makefile  |  2 +-
 .../platform/nxp/imx8-isi/imx8-isi-core.c     | 12 ++++--
 .../platform/nxp/imx8-isi/imx8-isi-core.h     | 30 ++++++++++++-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c | 42 +++++++------------
 .../platform/nxp/imx8-isi/imx8-isi-gasket.c   | 32 ++++++++++++++
 5 files changed, 85 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/Makefile b/drivers/media/platform/nxp/imx8-isi/Makefile
index 9bff9297686d..4376e8e0c962 100644
--- a/drivers/media/platform/nxp/imx8-isi/Makefile
+++ b/drivers/media/platform/nxp/imx8-isi/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 imx8-isi-y := imx8-isi-core.o imx8-isi-crossbar.o imx8-isi-hw.o \
-	imx8-isi-pipe.o imx8-isi-video.o
+	imx8-isi-pipe.o imx8-isi-video.o imx8-isi-gasket.o
 imx8-isi-$(CONFIG_DEBUG_FS) += imx8-isi-debug.o
 imx8-isi-$(CONFIG_VIDEO_IMX8_ISI_M2M) += imx8-isi-m2m.o
 
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 253e77189b69..d645b2f6fa5a 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -279,6 +279,12 @@ static const struct clk_bulk_data mxc_imx8mn_clks[] = {
 	{ .id = "apb" },
 };
 
+/* Gasket operations for i.MX8MN and i.MX8MP */
+static const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
+	.enable = mxc_imx8_gasket_enable,
+	.disable = mxc_imx8_gasket_disable,
+};
+
 static const struct mxc_isi_plat_data mxc_imx8mn_data = {
 	.model			= MXC_ISI_IMX8MN,
 	.num_ports		= 1,
@@ -289,7 +295,7 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
 	.clks			= mxc_imx8mn_clks,
 	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
 	.buf_active_reverse	= false,
-	.has_gasket		= true,
+	.gasket_ops		= &mxc_imx8_gasket_ops,
 	.has_36bit_dma		= false,
 };
 
@@ -303,7 +309,7 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
 	.clks			= mxc_imx8mn_clks,
 	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
 	.buf_active_reverse	= true,
-	.has_gasket		= true,
+	.gasket_ops		= &mxc_imx8_gasket_ops,
 	.has_36bit_dma		= true,
 };
 
@@ -443,7 +449,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
 		return PTR_ERR(isi->regs);
 	}
 
-	if (isi->pdata->has_gasket) {
+	if (isi->pdata->gasket_ops) {
 		isi->gasket = syscon_regmap_lookup_by_phandle(dev->of_node,
 							      "fsl,blk-ctrl");
 		if (IS_ERR(isi->gasket)) {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index e469788a9e6c..4f920d650153 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -12,12 +12,14 @@
 
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/regmap.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
 #include <linux/videodev2.h>
 
 #include <media/media-device.h>
 #include <media/media-entity.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-dev.h>
@@ -59,6 +61,18 @@ struct v4l2_m2m_dev;
 #define MXC_ISI_M2M			"mxc-isi-m2m"
 #define MXC_MAX_PLANES			3
 
+/* GASKET (i.MX8MN and i.MX8MP only) */
+#define GASKET_BASE(n)				(0x0060 + (n) * 0x30)
+
+#define GASKET_CTRL				0x0000
+#define GASKET_CTRL_DATA_TYPE(dt)		((dt) << 8)
+#define GASKET_CTRL_DATA_TYPE_MASK		(0x3f << 8)
+#define GASKET_CTRL_DUAL_COMP_ENABLE		BIT(1)
+#define GASKET_CTRL_ENABLE			BIT(0)
+
+#define GASKET_HSIZE				0x0004
+#define GASKET_VSIZE				0x0008
+
 struct mxc_isi_dev;
 struct mxc_isi_m2m_ctx;
 
@@ -147,6 +161,14 @@ struct mxc_isi_set_thd {
 	struct mxc_isi_panic_thd panic_set_thd_v;
 };
 
+struct mxc_gasket_ops {
+	int (*enable)(struct mxc_isi_dev *isi,
+		      const struct v4l2_mbus_frame_desc *fd,
+		      const struct v4l2_mbus_framefmt *fmt,
+		      const unsigned int port);
+	void (*disable)(struct mxc_isi_dev *isi, const unsigned int port);
+};
+
 enum model {
 	MXC_ISI_IMX8MN,
 	MXC_ISI_IMX8MP,
@@ -159,10 +181,10 @@ struct mxc_isi_plat_data {
 	unsigned int reg_offset;
 	const struct mxc_isi_ier_reg  *ier_reg;
 	const struct mxc_isi_set_thd *set_thd;
+	const struct mxc_gasket_ops *gasket_ops;
 	const struct clk_bulk_data *clks;
 	unsigned int num_clks;
 	bool buf_active_reverse;
-	bool has_gasket;
 	bool has_36bit_dma;
 };
 
@@ -379,6 +401,12 @@ void mxc_isi_channel_set_outbuf(struct mxc_isi_pipe *pipe,
 u32 mxc_isi_channel_irq_status(struct mxc_isi_pipe *pipe, bool clear);
 void mxc_isi_channel_irq_clear(struct mxc_isi_pipe *pipe);
 
+int mxc_imx8_gasket_enable(struct mxc_isi_dev *isi,
+			   const struct v4l2_mbus_frame_desc *fd,
+			   const struct v4l2_mbus_framefmt *fmt,
+			   const unsigned int port);
+void mxc_imx8_gasket_disable(struct mxc_isi_dev *isi, const unsigned int port);
+
 #if IS_ENABLED(CONFIG_DEBUG_FS)
 void mxc_isi_debug_init(struct mxc_isi_dev *isi);
 void mxc_isi_debug_cleanup(struct mxc_isi_dev *isi);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index f7447b2f4d77..d803fda3fdaf 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -25,32 +25,18 @@ static inline struct mxc_isi_crossbar *to_isi_crossbar(struct v4l2_subdev *sd)
 	return container_of(sd, struct mxc_isi_crossbar, sd);
 }
 
-/* -----------------------------------------------------------------------------
- * Media block control (i.MX8MN and i.MX8MP only)
- */
-#define GASKET_BASE(n)				(0x0060 + (n) * 0x30)
-
-#define GASKET_CTRL				0x0000
-#define GASKET_CTRL_DATA_TYPE(dt)		((dt) << 8)
-#define GASKET_CTRL_DATA_TYPE_MASK		(0x3f << 8)
-#define GASKET_CTRL_DUAL_COMP_ENABLE		BIT(1)
-#define GASKET_CTRL_ENABLE			BIT(0)
-
-#define GASKET_HSIZE				0x0004
-#define GASKET_VSIZE				0x0008
-
 static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
 					  struct v4l2_subdev_state *state,
 					  struct v4l2_subdev *remote_sd,
 					  u32 remote_pad, unsigned int port)
 {
 	struct mxc_isi_dev *isi = xbar->isi;
+	const struct mxc_gasket_ops *gasket_ops = isi->pdata->gasket_ops;
 	const struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_mbus_frame_desc fd;
-	u32 val;
 	int ret;
 
-	if (!isi->pdata->has_gasket)
+	if (!gasket_ops)
 		return 0;
 
 	/*
@@ -77,16 +63,14 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
 	if (!fmt)
 		return -EINVAL;
 
-	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_HSIZE, fmt->width);
-	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_VSIZE, fmt->height);
-
-	val = GASKET_CTRL_DATA_TYPE(fd.entry[0].bus.csi2.dt)
-	    | GASKET_CTRL_ENABLE;
-
-	if (fd.entry[0].bus.csi2.dt == MIPI_CSI2_DT_YUV422_8B)
-		val |= GASKET_CTRL_DUAL_COMP_ENABLE;
-
-	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, val);
+	if (gasket_ops->enable) {
+		ret = gasket_ops->enable(isi, &fd, fmt, port);
+		if (ret) {
+			dev_err(isi->dev,
+				"failed to enable gasket%d\n", port);
+			return ret;
+		}
+	}
 
 	return 0;
 }
@@ -95,11 +79,13 @@ static void mxc_isi_crossbar_gasket_disable(struct mxc_isi_crossbar *xbar,
 					    unsigned int port)
 {
 	struct mxc_isi_dev *isi = xbar->isi;
+	const struct mxc_gasket_ops *gasket_ops = isi->pdata->gasket_ops;
 
-	if (!isi->pdata->has_gasket)
+	if (!gasket_ops)
 		return;
 
-	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, 0);
+	if (gasket_ops->disable)
+		gasket_ops->disable(isi, port);
 }
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
new file mode 100644
index 000000000000..39f8d0e8b15d
--- /dev/null
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2019-2023 NXP
+ */
+
+#include "imx8-isi-core.h"
+
+/* Configure and enable gasket for i.MX8MN and i.MX8P */
+int mxc_imx8_gasket_enable(struct mxc_isi_dev *isi,
+			   const struct v4l2_mbus_frame_desc *fd,
+			   const struct v4l2_mbus_framefmt *fmt,
+			   const unsigned int port)
+{
+	u32 val;
+
+	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_HSIZE, fmt->width);
+	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_VSIZE, fmt->height);
+
+	val = GASKET_CTRL_DATA_TYPE(fd->entry[0].bus.csi2.dt);
+	if (fd->entry[0].bus.csi2.dt == MIPI_CSI2_DT_YUV422_8B)
+		val |= GASKET_CTRL_DUAL_COMP_ENABLE;
+
+	val |= GASKET_CTRL_ENABLE;
+	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, val);
+	return 0;
+}
+
+/* Disable gasket for i.MX8MN and i.MX8P */
+void mxc_imx8_gasket_disable(struct mxc_isi_dev *isi, const unsigned int port)
+{
+	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, 0);
+}
-- 
2.37.1

