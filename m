Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D82FB740A7E
	for <lists+linux-media@lfdr.de>; Wed, 28 Jun 2023 10:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233223AbjF1IGj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jun 2023 04:06:39 -0400
Received: from mail-vi1eur03on2087.outbound.protection.outlook.com ([40.107.103.87]:29025
        "EHLO EUR03-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232524AbjF1H67 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jun 2023 03:58:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7piS9IUi25K6ua2D2Q4mLeOq9JU5lzLB5zrWvkphj2BfFZLkCZko5181qdvdaS8NZC5SIWwy+fMSnTKWgVWyr/08EaA/Rs0Iy0qux9wLnRFqdQb9gWWlGtP+gP2c9NopdMGttdhL4Z50fCErX8szLVuy0BNFOAtQoHT+dxeZBjndRb9BSzzZemLiTLf/0nzURuRvn92XU/Lmv5+ce74Eed7Ud6WSSEJt6b0ZwqqNQnFLd0840oIki7hiHQXZbU+I+qPQJ14V5zvKLykeZizSh4mlmGrA9c7ZUuxobOln6GjBPrHR4a7wpCqyrpPBVE9j8AJhvabrlH8bJb01/2aUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9RCBzgUm8Ldd34+SRuZWQEDABJ6/yKzj4FDgOg7zoM=;
 b=Y0AkAxFZYrY+4v/QQeJvLxQolUCGRjt7RVXeaxpXIc2i0mk90Esygx6yOefA1WWwKV5prRBxQdE95mFbCM9/PkJp9n5kX+ufFvQIU1UBZoCJUXA6LxE6qEwN1OwFy6huaIjDSzYc5rlwhWMpj4PSe63Uvh4wUh53XcwrsMuoyMN353ikP+/aUyPTjmnrz5hn8bnF4SF2fE2qqbhZshw/QkwdwrU3elza4XWl3SMSNkJprLFR21PA/MGLUthGU6Qa4fiiO6uaw3/3M9tyH4oHSkGWc/lYJ+Zl9m5oeo47lxFZO6eJdQWQJ1q+D0NAULNRGWFE00yztQnJOQMWiKYZXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9RCBzgUm8Ldd34+SRuZWQEDABJ6/yKzj4FDgOg7zoM=;
 b=RI06cSZ+khxvxSTD+8ro5o4jUrTE8up7W9z6p6+sHyyrywHHajH0vvieWEnRUxAMrqgdMNa/vty+gMLMIsMJwcaYzFcr1w3l5ZG7oFmGwIEzKMwwflydlO4VcgbOqMb4mRJsomQOpOTrwi0M7qFgD584DIUnQ257AQZf/qJ1NgY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DB9PR04MB9578.eurprd04.prod.outlook.com (2603:10a6:10:305::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 06:38:18 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 06:38:18 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Subject: [PATCH v4 3/3] media: nxp: imx8-isi: add ISI support for i.MX93
Date:   Wed, 28 Jun 2023 14:42:51 +0800
Message-Id: <20230628064251.1774296-4-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230628064251.1774296-1-guoniu.zhou@oss.nxp.com>
References: <20230628064251.1774296-1-guoniu.zhou@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DB9PR04MB9578:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ffca3df-ebfe-49de-194d-08db77a24212
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +AOeRrp/20PRSr+U2K/0K6W+LO/Tq988hTxmbPwScByrLA0+DisyOE+kiO3n3N55w/evlMWk9/3RFXPFeWPT72bJSp03cP9fDbqy+w8wqTwrQnSOEhkY0eMi2e7qxYtAt7wwK0F3dJDRucAJg59I7HadHzay3LiI6hOBDuwMDff0R6+QyVG7Ky2zR2oA6bh0U/36kPcD6TK0lXRSTgf+LXkbvcKnfcYvEb3lzIyiYB/jEiverfu1UUF+TScRdOOtulF99sMt5Hp6rc0vhFMJZ3vBQYUI7yHYn8TU1BlxahdBgP5lANcbgRFZmsPzu/8OGlHr5I1Eua2dl/YeTT8RRBHF7Mg9A+8gA1663PT3CsU1+w+PQ4Fff+GiIpFpH2DWe892VM+petE1giCdm4/6VinDB8mUCWeZ7ZtO0dXzblQxQFCjuIwhG7Vaykk00nnv5r4LKVdHRSvwm+wWS6X18BVOfIBbTjuqoijsUozsqLboDZuKbv8qiDPw3NpO/A6BDHFZ9GXOeu+5H0notLuH0gMBjP/pzqVaMTK2CL5gHLhgf3pOfi+n+9wWuAqL7kN9JbiQCicGjQPhWDD+3EVFxZu0uYlIPsx3TM9uimi5fTtDM++F8ITob9mjB2oPj8lk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199021)(38350700002)(38100700002)(83380400001)(86362001)(2616005)(6486002)(52116002)(6666004)(41300700001)(66556008)(66946007)(316002)(66476007)(8676002)(1076003)(26005)(9686003)(4326008)(6512007)(186003)(6506007)(8936002)(2906002)(478600001)(5660300002)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J9P+GI77wslb7az9O0bhPcqV7IxCov5mgN/JqXu7HVCtqQ++DWFA/Ix0DTq6?=
 =?us-ascii?Q?48vQBod/MC4sB8Zz6v2ToRtgrsBvGcQFMvP1aT6CKUqwlIxW6N3EbocgX+9g?=
 =?us-ascii?Q?cuSxx/ISn7FpBn6mhKvepYdO4JUXdHPRIBt0rYlQs69opRIdT+E5IsQuP7Lf?=
 =?us-ascii?Q?6OsQxhytoap4VPvLL5B+YTp8j4iD2c9Un9S0e30l/WrOOwx+sOWl0L5Cjdb1?=
 =?us-ascii?Q?3PLH60KfRvCSFrzzImyBZGaf/F1AlHvAUi0XhYz42lLGIoPVb3UgvVztk4++?=
 =?us-ascii?Q?IsUmvpxAGE9T7WSJGNy5hC6C4p2dhNqootO0NXjezBzKxnWXNNaOqI0NqHOk?=
 =?us-ascii?Q?Akxk0dngO+ucSJ0Rkuo2pB3V5bb8WQhcA+gdYx65Q5m62ilLHzZ84P3EYSWr?=
 =?us-ascii?Q?mObbcTf9nTIzUwkV1Awww+XD5mKO56oY7mYCM7j7KzDzfezxBVOR//mgzfjU?=
 =?us-ascii?Q?bhMHSZ5tRkIOK3YUrRBIAWDRPAuyBufi1ug5IkfWkXrmSZdtuQsKo7urmn7I?=
 =?us-ascii?Q?Op7m/OJyP8nKdNBwdq5s9+SnUGtJNEMP1I2IiANAFlkiEJo2QbY2m2iVmz35?=
 =?us-ascii?Q?C0XxY45fNBI//c1l3O94Mij084rmCU2FcGsrQZFTppVOcwwM6X2zb6QIHp9C?=
 =?us-ascii?Q?av7PAaRe4ZXsNo3lHlbRFOV5ZaQpXoXgQgBrRsbjUh+XpRceMcmQrEBUestN?=
 =?us-ascii?Q?dHJfurolKJbvz/Me3P+8rqhapmdENIX1jBBdqLhmJcRbqB7H1vhu3AD6QUsH?=
 =?us-ascii?Q?gNTy3Pxal2mUGBs7fqMW2ZUCmBqY0Pm2lCkMC82gQApkhxVhswA5TgN4Vf20?=
 =?us-ascii?Q?PxBVkoJvWuDUxYXOcp3BxuQzmy9ddWt8lv//ohBxyJNrNgdkI5/b7MoQqRlr?=
 =?us-ascii?Q?HNsrh35x+dODxs4bi/5fxoFeewWzqc4l6x3x/pescsm/3hGqY5XWHOYoUrko?=
 =?us-ascii?Q?pAvkHcD0aIvYnh6w3N0f4yo2lrO8Sm6gUE3Gy2KVpUrJefXPd1/F23Zg2TuM?=
 =?us-ascii?Q?1JKaeXYJygaBocTC0NIg0uJXMHv5KuvC6yQpXJNCBnKP/UM0Emnrh0c3NxAj?=
 =?us-ascii?Q?2da6M47QBfYs/2eIZyhBt7YwjGZVK2phY3gxxMZqh9QoEoF+zeiHXyLOXwIu?=
 =?us-ascii?Q?oGdqQ54dNVfZ1n169nsEHoDGqN3PfVsYMnc6WvTq3Nh3/owOu/Ay+G3wXND8?=
 =?us-ascii?Q?kumGtEJZocxklp0B7x6IOZs/dAXMoFMP2tPQy/MRKkne28D0wCb82LemRsfl?=
 =?us-ascii?Q?cfMUO3VzuggxeNLbsfsciEa+oGabAEmjRZTZc7hAeEU1pt81VLhYLujHC2x1?=
 =?us-ascii?Q?d25zzESO0/NT05LkymNBOq4+TCwKvL6xx2+E1NVvCkFvDqQd/23rcQrlciZ7?=
 =?us-ascii?Q?XCNy1qbJShajJxw1yAKM6qVPgtULnbL0YZGZvwnmwv1YtOzX28YAxIvRjYfp?=
 =?us-ascii?Q?sABrCgdxwGH10PAoVtY2uqsx0h3Y0Qh3XqJxdfLIlkii2QWzVYBp0JRSzDMf?=
 =?us-ascii?Q?ms6imgryhNslzftlGOtvvTj00HOIOHU+gJ1e/IzzOo9KL8VsV21E5GKNVU/L?=
 =?us-ascii?Q?plNIqjSfmm1JzyzDqaV5zQSSDm1wZcAxJ5nETA25?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ffca3df-ebfe-49de-194d-08db77a24212
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 06:38:18.2324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KTcBoRgruJdvlPcbLJEUCR3p+Ov/+FvRj8VtDWKdbMHLVanoBHIRXImngpa3sxuMLWpf3Kyyzq8971A8iiaz1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9578
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

i.MX93 use a different gasket which has different register definition
compared with i.MX8. Hence implement the gasket callbacks in order to
add ISI support for i.MX93.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/nxp/imx8-isi/imx8-isi-core.c     | 15 ++++++++++
 .../platform/nxp/imx8-isi/imx8-isi-core.h     |  2 ++
 .../platform/nxp/imx8-isi/imx8-isi-gasket.c   | 28 +++++++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index f2774325dd61..13a0225de634 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -304,6 +304,20 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
 	.has_36bit_dma		= true,
 };
 
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
@@ -515,6 +529,7 @@ static int mxc_isi_remove(struct platform_device *pdev)
 static const struct of_device_id mxc_isi_of_match[] = {
 	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
 	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
+	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 87182ebb99f0..ddd3d8ce4000 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -150,6 +150,7 @@ struct mxc_gasket_ops {
 enum model {
 	MXC_ISI_IMX8MN,
 	MXC_ISI_IMX8MP,
+	MXC_ISI_IMX93,
 };
 
 struct mxc_isi_plat_data {
@@ -287,6 +288,7 @@ struct mxc_isi_dev {
 };
 
 extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
+extern const struct mxc_gasket_ops mxc_imx93_gasket_ops;
 
 int mxc_isi_crossbar_init(struct mxc_isi_dev *isi);
 void mxc_isi_crossbar_cleanup(struct mxc_isi_crossbar *xbar);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
index f3758af59db1..96f36a6d8a3c 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
@@ -19,6 +19,11 @@
 #define GASKET_HSIZE				0x0004
 #define GASKET_VSIZE				0x0008
 
+/* dispmix_GPR register (i.MX93 only) */
+#define DISP_MIX_CAMERA_MUX                     0x30
+#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        (((x) & 0x3f) << 3)
+#define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
+
 /* Configure and enable gasket for i.MX8MN and i.MX8P */
 static void mxc_imx8_gasket_enable(struct mxc_isi_dev *isi,
 				   const struct v4l2_mbus_frame_desc *fd,
@@ -50,3 +55,26 @@ const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
 	.enable = mxc_imx8_gasket_enable,
 	.disable = mxc_imx8_gasket_disable,
 };
+
+/* Configure and enable gasket for i.MX93 */
+static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
+				    const struct v4l2_mbus_frame_desc *fd,
+				    const struct v4l2_mbus_framefmt *fmt,
+				    const unsigned int port)
+{
+	u32 val;
+
+	val = DISP_MIX_CAMERA_MUX_DATA_TYPE(fd->entry[0].bus.csi2.dt);
+	val |= DISP_MIX_CAMERA_MUX_GASKET_ENABLE;
+	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, val);
+}
+
+static void mxc_imx93_gasket_disable(struct mxc_isi_dev *isi,
+				     unsigned int port)
+{
+	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, 0);
+}
+const struct mxc_gasket_ops mxc_imx93_gasket_ops = {
+	.enable = mxc_imx93_gasket_enable,
+	.disable = mxc_imx93_gasket_disable,
+};
-- 
2.37.1

