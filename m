Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0CB873F45E
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 08:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbjF0GQN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 02:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbjF0GQG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 02:16:06 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C861268C;
        Mon, 26 Jun 2023 23:16:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpDljuC3E7fjTQvVonYBvnT/FLkCnbBtw5Voe+yAxUTEcx582yRGVxCOpxXZA6DsWOUqAq8IqSTxC4tZqiGTroe/82mm0prYzBb1eK1WfGz3n8ga+9+klXaiihFkT8nvpyt0zG9yXBRCfVsoz45a2gaoQFVdB/Az8Q37yazUXLDBClJwi2Hb3CGGdcQ18lKu9ZJGVD0Q2qkf8lFdn9sJbrpQuryoSQH1MQvxarNFtB/4OIkE69fmPFgZbxp7ESqQu9AepPbKLbqxb9fYj9gWOb1MRLP60lgXnge2Wv1kGavsClWGTqk1Zfu2M4FbYxOkXc9xIuGdyfHy7M7sjbK0IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZpoGdRnoWhneV4unAKGgHeoe9cmbYW5fpYmySgPXWk=;
 b=CdlSLE9v1E0SDCStEKQUuQkCkZgDOkTZVx+pzZLvBFsv1PDMHT5A9OBYvElErgcW/oVfD5jmC4HgS4roWvoBWN56neWWv4M0dBn1DS3qPanR6S9JcaAbFulncOwzbQV8TNVwOZYft1N/2ljo5J9mYNX3FKEvsoUDeoVsHEWo57RGo/pRgIj5UxJJzRRRXHWTCqt1ZBTaD8JMnsPAIOKMtcmhIm+lz/EVgS/e2gGkScdF8iyCYW2GbKlwWSEXD2WMv9DSWxHdUY7zfF7VPmF7OAMQ2yJQJGK0J4M6EIIs/NdhJ7KA54gq2n3znTbMA88oCNjEV3Cih7Uaxe0xPSvQZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZpoGdRnoWhneV4unAKGgHeoe9cmbYW5fpYmySgPXWk=;
 b=AA/Bux/ws+hMB+4s8lAEQj+jWqn+jqXE3SljLqUJ0Nhqt3c3mwAy7vHD9ESQwhiQM08kX5VCN7XoSOIxIW8M2RZtFI534Y42q60NRirwTysYamNkGl6tcZ5EVrvspPD9hVZb2D4yM919JOd2ipCkf7fSl0SEY66Zyv822p0ucAo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DB8PR04MB7004.eurprd04.prod.outlook.com (2603:10a6:10:11c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Tue, 27 Jun
 2023 06:15:46 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6521.023; Tue, 27 Jun 2023
 06:15:46 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Subject: [PATCH v3 3/3] media: nxp: imx8-isi: add ISI support for i.MX93
Date:   Tue, 27 Jun 2023 14:20:17 +0800
Message-Id: <20230627062017.1135114-4-guoniu.zhou@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: c40dc138-882c-45e9-9000-08db76d5f215
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pVa6f77nxhuGPKIW3VsvpxS1GGK89WgUb30CFGfz3KsLU/LGWyGQvt9aGpcA32R09DVJqtsB3a4PqLggFbhxnO1HMFDqJdYNeAIwo+BqqPtgWISK44iSZngq+vp8FJ38OIew5OAOZ9ii4xWC3xfBxBsuWCZG06RL3lJZdQOxiE+pqGk9Caj1YX1UgplMlWqNMsh3uas5KtZ8jDO7cYL0unTaczLj6N3doJK/j5XKMO2YxbEsbx3PECrq8gStBOvLknhHPaJmLntULO84EIwD2+q0hpiXtg5BNWyDseK1XkeO9fQsaxOYrRqnH8JnNvPCwwB2kBQ03JoFNDBOznV4R/VtPmKH8kGMq8k13vDs873lP7pm+NzYy6n06qiTxjjLdcV9kD4kqy042oQW0p7S4W7yZDQoTF6zNm37ICc620LNl/FVGc8k4nu79AVmW31/YhYOWX8idUDhPwqCrOOB5dU1SM/l6YJN+yeZ8wTcqPbKgej54Ebcal1dfbkxtK6kY1R7cLgWfKwth8bByyx3dmD0UeIJavr/2ld6Rsz7guPBymC+MVY7JCuir5hSuhk3E3laUpUw9vY68KfgTg4zF4CAE0OkE8PSUmhQCK444kxN74gTKn7CGTAkdCSerol4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(451199021)(186003)(2906002)(26005)(1076003)(52116002)(38350700002)(2616005)(38100700002)(6512007)(6506007)(5660300002)(41300700001)(9686003)(66556008)(83380400001)(66476007)(66946007)(8936002)(8676002)(6666004)(7416002)(316002)(478600001)(86362001)(6486002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?asPZjbOM9PpAuqUON3aQ8v3ON3DDPe9qdIImyVX9SA4BD3+fC3gVglGB5yb0?=
 =?us-ascii?Q?/45++7crz8AcVOrG1bawCCJPp87JLHnt1/Z0IqcBXFHkGtGIa9ZNPiwKnU1J?=
 =?us-ascii?Q?OcanodF1YHOVoRE3zqQIAlH3RHrnILZzhaKJq5qVURPvcUix0NudrU/uVuPt?=
 =?us-ascii?Q?JxOBRqCf0R2lqQvGNVrf8pOurCfdNzBKAVQvf9MvoogqxV9zmzXTh7q3KyYC?=
 =?us-ascii?Q?RJE2rofBnN29vt+QvqyJLvWEP+R4bWqF5EyJQjym5j01+VFRBmH0kPC1cyCg?=
 =?us-ascii?Q?LNjxHVI7aYsEJRqQVqfkQd3N63s52rQ99Zmnjgsp9LcW+KFIJJ2VysXLeLb/?=
 =?us-ascii?Q?TAEnqXE0YlQ2EjLMRh6wEp1RZp1yLcprLeufpwnmZalPiwOmPmc1zpNt8Mz0?=
 =?us-ascii?Q?uJ85Qu4igmIjzR4Usu6M92aSaWKaa5/5kyz0d2NpEahAbkZzvZNArUiKRyZW?=
 =?us-ascii?Q?sCGeiS7U6EpseipznYH4nlHTy4iqqgdHOIIBqAt/JoII228AZJ1ezEzp4ao7?=
 =?us-ascii?Q?5Pmy3uJeQhwhDKqwHEYXy7c3ZBTC2rTbw2A66abPojoEghOmg8hqFgqaFI/J?=
 =?us-ascii?Q?QYyARLQ82qPeP5LCpKTvGGv8N8DeMSh1kZ0FqkT+48DsHhLV2rMv02w3FXsK?=
 =?us-ascii?Q?m3/tr2FMYHXtWfTC0WGdMT+HRHH2HjxYh/tc+tSWSqVoQ0Km22F0k3abJqS4?=
 =?us-ascii?Q?om1BtD2Fa/E+Ps2rI3/QZSYATVtoYm0YYuwanK8m5BDAOu4J4wsWO8pgLqGr?=
 =?us-ascii?Q?eYI+RJhFpGkOJe0y6q0HItlMGeYX5ADHKCKS7LxVL/djaknyt5avpssRD3fS?=
 =?us-ascii?Q?1N+sdd6sB78h0FwcFWlfbqKGY8lA9I44c+1bWYd5WzWN7NEV9W5Xfy3hXbGn?=
 =?us-ascii?Q?TPiE+vxItz/ddRTz3cFzt2cKSesCBw62V3libcu7iuYT1XQtE73Ek322fkRm?=
 =?us-ascii?Q?27cwWkbs4I2Har4K1R9T35myxLMVApo/FRgTh7zM9AXC14/3NTe85dqgnroA?=
 =?us-ascii?Q?U4z4xTH1Lc0WYMmi2SJOLoq95DCx9zyvrfozQ4IWj87z7Vpy5fdi++L0qaKm?=
 =?us-ascii?Q?c4B7xGmotTFVSgDDAUfybI7gsxEK27g9oe474gKwVIH6mTzuh5574/q2Njdl?=
 =?us-ascii?Q?GUX8TSeHIpSmWMxcUShOvxsOvKWw1fyU4Hdu+bcotHwsC21RpgS1UTliIoJF?=
 =?us-ascii?Q?guRZIlKu2pPGKIVRgzoI771t8gr9kJoUU5ANoRYd9heDc97pHpkHabN3RRG3?=
 =?us-ascii?Q?Dta+jGUAWd9YIit3QX9Ag8UAQqzZTWDCHK7SUGpyoPISMzG4ANVAX87q4Cl8?=
 =?us-ascii?Q?kwaG+0tJu+yqYDoH2Z40JiOukbf7CqA+1WSlUuznP0+Ur22Dk3ENQSI+Os05?=
 =?us-ascii?Q?3fObYy7VzqP/muuCOEISAP8rqhJF/CujhW4KNHgLDk06tH/GDxZkwxwjfTMg?=
 =?us-ascii?Q?c5ak5M93vMwFJ1SJWTOXC+fJnPhNVGTzLEGFBrXUG/9FKg4sWrDqGOw46ZMl?=
 =?us-ascii?Q?vmVoFiWRpC1IUz6Yi++9/Av5MLLh9mWnDoGyKm0iAMyMlYJhyJphHKDjEmUr?=
 =?us-ascii?Q?0xW90JzMeJmaIbGZrpOxNtk2XtdpKY6DLKMhPkP7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c40dc138-882c-45e9-9000-08db76d5f215
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 06:15:46.6350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RWtqh0D7DWiax9iig6DEkoRDPqJe+qhl6C12ugRTCza91QePEreTQGkbj4OFqZlyukwTSO5HpjQ11S7bFf6RWw==
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

i.MX93 use a different gasket which has different register definition
compared with i.MX8. Hence implement the gasket callbacks in order to
add ISI support for i.MX93.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
 .../platform/nxp/imx8-isi/imx8-isi-core.c     | 20 ++++++++++++++++++
 .../platform/nxp/imx8-isi/imx8-isi-core.h     | 12 +++++++++++
 .../platform/nxp/imx8-isi/imx8-isi-gasket.c   | 21 +++++++++++++++++++
 3 files changed, 53 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index d645b2f6fa5a..24c40e4cfef5 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -313,6 +313,25 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
 	.has_36bit_dma		= true,
 };
 
+static const struct mxc_gasket_ops mxc_imx93_gasket_ops = {
+	.enable = mxc_imx93_gasket_enable,
+	.disable = mxc_imx93_gasket_disable,
+};
+
+static const struct mxc_isi_plat_data mxc_imx93_data = {
+	.model			= MXC_ISI_IMX93,
+	.num_ports		= 1,
+	.num_channels		= 1,
+	.reg_offset		= 0,
+	.ier_reg		= &mxc_imx8_isi_ier_v2,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.clks			= mxc_imx8mn_clks,
+	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
+	.buf_active_reverse	= true,
+	.gasket_ops		= &mxc_imx93_gasket_ops,
+	.has_36bit_dma		= false,
+};
+
 /* -----------------------------------------------------------------------------
  * Power management
  */
@@ -524,6 +543,7 @@ static int mxc_isi_remove(struct platform_device *pdev)
 static const struct of_device_id mxc_isi_of_match[] = {
 	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
 	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
+	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 4f920d650153..f5be5394981e 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -73,6 +73,11 @@ struct v4l2_m2m_dev;
 #define GASKET_HSIZE				0x0004
 #define GASKET_VSIZE				0x0008
 
+/* dispmix_GPR register (i.MX93 only) */
+#define DISP_MIX_CAMERA_MUX                     0x30
+#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        (((x) & 0x3f) << 3)
+#define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
+
 struct mxc_isi_dev;
 struct mxc_isi_m2m_ctx;
 
@@ -172,6 +177,7 @@ struct mxc_gasket_ops {
 enum model {
 	MXC_ISI_IMX8MN,
 	MXC_ISI_IMX8MP,
+	MXC_ISI_IMX93,
 };
 
 struct mxc_isi_plat_data {
@@ -407,6 +413,12 @@ int mxc_imx8_gasket_enable(struct mxc_isi_dev *isi,
 			   const unsigned int port);
 void mxc_imx8_gasket_disable(struct mxc_isi_dev *isi, const unsigned int port);
 
+int mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
+			    const struct v4l2_mbus_frame_desc *fd,
+			    const struct v4l2_mbus_framefmt *fmt,
+			    const unsigned int port);
+void mxc_imx93_gasket_disable(struct mxc_isi_dev *isi, const unsigned int port);
+
 #if IS_ENABLED(CONFIG_DEBUG_FS)
 void mxc_isi_debug_init(struct mxc_isi_dev *isi);
 void mxc_isi_debug_cleanup(struct mxc_isi_dev *isi);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
index 39f8d0e8b15d..a81c4249a26f 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
@@ -30,3 +30,24 @@ void mxc_imx8_gasket_disable(struct mxc_isi_dev *isi, const unsigned int port)
 {
 	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, 0);
 }
+
+/* Configure and enable gasket for i.MX93 */
+int mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
+			    const struct v4l2_mbus_frame_desc *fd,
+			    const struct v4l2_mbus_framefmt *fmt,
+			    const unsigned int port)
+{
+	u32 val;
+
+	val = DISP_MIX_CAMERA_MUX_DATA_TYPE(fd->entry[0].bus.csi2.dt);
+	val |= DISP_MIX_CAMERA_MUX_GASKET_ENABLE;
+	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, val);
+
+	return 0;
+}
+
+void mxc_imx93_gasket_disable(struct mxc_isi_dev *isi,
+			      unsigned int port)
+{
+	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, 0);
+}
-- 
2.37.1

