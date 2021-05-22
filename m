Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E21038D776
	for <lists+linux-media@lfdr.de>; Sat, 22 May 2021 23:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbhEVVNp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 May 2021 17:13:45 -0400
Received: from mail-eopbgr70051.outbound.protection.outlook.com ([40.107.7.51]:12614
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231386AbhEVVNo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 May 2021 17:13:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wz8ZnFsrCutDoVbu8b9lsQgnNZZhdnJiuaToCj1Eh1mwWn8hqFzos7q7fwhoLCF6n39BxqLeAxEV9BF7iw9EPi6vGBePT0DWP2pVZlxXeHf00CK0SWJTwl0V8BiBbjg09Y1nR9fWmPFqAK0+TpeeSI3FjPq3ZdpC5LlvU6x+KRwrWrRgDK5xbPbKOTgvdVdvArsIOoRAOmKGFTCl7HVXmDWwsT8s+I6tUn0ftpV/GY6otzqoeT0oDBNYZEZNeuikax/xBEWLjzWYyJy+91F+DcS3N8p/bx6AKejC68BKu4b0vhN0DIVESkFGYYRYkrLyf06uHlI5D33LsDL3nGTSOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGYVtezWPnqL7lFkXRGaTma91I8r7WP+UEekj5s5HXA=;
 b=BDkmRYy/xCb7c1OcuaipqRDGlIujDURnn74RYgEA3tMBLmGCFQvBT95/yg1xm8tU3tOA/QXFqfUjfxCHPLsQAkw1/GXle86Y0rJpkOVaFOLEqBmAubkFpYrFeAzuj9J8ridfP9UUSomo1jEiS/KviJnAoPFhGhsSXSZ1Cj505YSPHKiGwtjWmeiEk2Q4bCpuuFtzNfTENeZfaQvTfDv0AmIOcZiZEB79FcDwn4BjqSRR10O6IFcn95zMutdx0H5zAaz6RSexSxGmLJJPdQ4BtkEM9IfUCp3xJCIP/kfE4uSFXBOs6Ri/RLTC9RJ6AX+qEVi0ZvMFFRAUJe7YQn1GFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGYVtezWPnqL7lFkXRGaTma91I8r7WP+UEekj5s5HXA=;
 b=W8ywCdJhOes0lZahZtvnZDWYDJItSucdsm+lXbNrDztnomCQs90vi3pzFN1N4iVzMuf6SR/uIq+JCywquFcaz34K1shbehZdqsWPoKfC0taJYYgLJbuA7rHlH7HwaxFUkjW/+S/H9GYQVhSz2Qrk5Mrq1mWLMxs6KNrmPC7MzUA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from HE1PR04MB3146.eurprd04.prod.outlook.com (2603:10a6:7:21::17) by
 HE1PR04MB3260.eurprd04.prod.outlook.com (2603:10a6:7:1c::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.27; Sat, 22 May 2021 21:12:14 +0000
Received: from HE1PR04MB3146.eurprd04.prod.outlook.com
 ([fe80::4564:419a:6e63:24b7]) by HE1PR04MB3146.eurprd04.prod.outlook.com
 ([fe80::4564:419a:6e63:24b7%4]) with mapi id 15.20.4150.027; Sat, 22 May 2021
 21:12:14 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     robh+dt@kernel.org, shawnguo@kernel.org, aisheng.dong@nxp.com,
        guoniu.zhou@nxp.com, linux-arm-kernel@lists.infradead.org,
        mchehab@kernel.org
Cc:     peng.fan@nxp.com, s.hauer@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        paul.kocialkowski@bootlin.com, daniel.baluta@nxp.com,
        robert.chiras@nxp.com, laurentiu.palcu@nxp.com,
        p.zabel@pengutronix.de, ezequiel@collabora.com,
        kernel@pengutronix.de, Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH v13 1/2] media: dt-bindings: imx-jpeg: Add compatible for i.MX8QM JPEG codec
Date:   Sun, 23 May 2021 00:10:54 +0300
Message-Id: <20210522211055.15988-2-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210522211055.15988-1-mirela.rabulea@oss.nxp.com>
References: <20210522211055.15988-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: VI1P190CA0028.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::41) To HE1PR04MB3146.eurprd04.prod.outlook.com
 (2603:10a6:7:21::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.30) by VI1P190CA0028.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:2b::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend Transport; Sat, 22 May 2021 21:12:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0f16c38-cd48-4cc0-56ad-08d91d664565
X-MS-TrafficTypeDiagnostic: HE1PR04MB3260:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1PR04MB3260F9D704D0735867CE1913CE289@HE1PR04MB3260.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iI2W/ws/VsAz7I8/bbD1uSBc4b/1ajaiPurSEHCj4quVkBn82sJ+JsuH2yi+uYq5pV9FWb7u2iSlNM5D8nYvZm3fmXolsGcWgggrYyyzYT/Rg87lrCUtmTUn+FwgMbJZJ0ZEi1mhDcZ9+SQdPXwic1IKZlwQxi4nHDJeyjBIzPNgXwEd2EWaQ1C5RisATjKMwmvSTgFv3bL/gHIyYElqB8dQSmpwQG3nFjwlhxwJIu4eytEU+n0T4JYHW1qh0Gjc7RGezLW5FLAV/7cUIaUNrNoh2ZHNc3YHqLRLZioNbtm9JWlJyZrHS903yw+RwMSsXvFIuEie4wB9lHSpI6xMQwDlbWW+SDaWqeb6rJcyhsqDNBHfbLdg6vWqqbuYDx2x6SKMCluZTSRLSnDEEFmvVh8HOrONQPzme5N8/V1YLsRQXLDlurIz2QcvyGRTIqGrddXCj0YFLlygJ1kyJTf74Yx3duTgkyZu/pU4mILZ0fodrtznqkzN1shXR81KpRPsbc4/H0oZcasjZymcfAH3yXQbEuj9sEfa4atZcsPwHHdKAIxC0JTbopj9zNeio9qR/uCd0flKTro4a2YFL+6aYCfT2jc7cgpblUIpMGqOVsCTrraDgSff2/nuH5CB5kQi+XnXg3q2Av7pJFVMxsWNbI5MuUaRMkZf8q1XarYziJ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR04MB3146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(136003)(39850400004)(396003)(8676002)(26005)(2906002)(5660300002)(478600001)(6506007)(316002)(52116002)(7416002)(4326008)(38350700002)(38100700002)(66556008)(6486002)(6512007)(66946007)(66476007)(8936002)(186003)(83380400001)(86362001)(16526019)(956004)(2616005)(1076003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OhkOSoq2bPfk0kMSyIFLvB71Fs/g60X/94smgwbhVjp4zwPbbRjYzZkk+Cn/?=
 =?us-ascii?Q?43G8PPLfdyUK4sDGetT0qUAGVT7OG5C2xhlJ296HrrxUmpicQskyqvq5hTkY?=
 =?us-ascii?Q?Qyb0dRT8UzVhLNQQ4356nFwFFzLFWBE0+4PrAToSxsX7q2ct0B3qshnH6fA1?=
 =?us-ascii?Q?alpRQ8agctCI27VYywpAAHnvY9Vv4UJOY0DY7QAf1qMYOrkfj0YIzGMAz5kP?=
 =?us-ascii?Q?qJEnWHgRhbLP61qrd5sELVNIeiHE1IdI4g5aWbaYZgkfCN4qLcKN7yLd3UPr?=
 =?us-ascii?Q?koq9TFmOHCwqqW8+Fz1NuelzeA39gjEjneofmYj+59sOBmyw0jFk9OPd6j3G?=
 =?us-ascii?Q?OA0IXwur6IAvtWAAvzIGmAYXGXAFUSy4FF/XK/ftWZC+xpPbxu569SU88Uqa?=
 =?us-ascii?Q?R7jzDcg4gn7NPlSH7i7Q10Yl6uQxlSx4v7FlJTBUthZ8QPUZhnfuuRxDxPKO?=
 =?us-ascii?Q?9UceGtfbrtXijo2xOkE+vPbwGf59PRiG0/oTWlliBS0uObEhb0nwiNYHDf3W?=
 =?us-ascii?Q?pzJjSsLkYCLmxdijgs3lM+rTO3Wus5d5nbhfdxHbrE0Uig6j7bZXMeo3LPso?=
 =?us-ascii?Q?KORlAan8mSk4hvKsu2jSca94fHppeT72fDKzS741cuKUsGYzaPVc5P8I/4xT?=
 =?us-ascii?Q?kNe9PMJaq3cUxIDdx4boOTegnRbwvH3/cCUv5Kp5VPshrl+liWF10U0hJudg?=
 =?us-ascii?Q?PejWWez+WmFTmPYqhfKoth7wG5U6pqF0KXdE9hGj//+dq28KgTWC3GlYtX88?=
 =?us-ascii?Q?6T9HN8ywywpWDD04u8ZcHzsQ4xCT0IcF82HdX2gTENJQf8KdPphfAg3hsvgc?=
 =?us-ascii?Q?M3I5qukXjvmpkl5pUAtBCLkkGHnvT8aXaN0/la/0wDCy6qNUd2NdseOYAUS+?=
 =?us-ascii?Q?EjStIZWiWKRPhfICkqPggZLVGvn02BBuVc75hjUw83nl4isDNcBAWfzjOl1k?=
 =?us-ascii?Q?AYzs9byVN9LGLXYMQEFPPVYHjZfXwSsZW7RYqLD5IJG8/dk2nDIWKCy9bPhB?=
 =?us-ascii?Q?EmBPMBJomL3QdnsGY1CE5cJFSG7unLmL2B+Uyasc6PvP6whj6GIvi7mBOY+e?=
 =?us-ascii?Q?x6CG9uvS0SqBpoNnRjE6Trs0vis+FUCAV/FKDugwk99EqpPY6hJzUCEM7hCh?=
 =?us-ascii?Q?sFxnqj0Zb5DLQQ0s4QQJMpKohKzRyt3rxE9BqaS+j4GHVXVCAV1HZeKpIovk?=
 =?us-ascii?Q?Pei2Z25KJVz4sZanh7obmeWWk32rWevJnXIIYp9GHtO1EsDT5NC2gyno53Kp?=
 =?us-ascii?Q?l+YI5DRZKLRtqsKo9YouK0ikyP3tR5F5cZpTxHLG4dtiTOUY8PLMfKwzLw01?=
 =?us-ascii?Q?Re1wLoN7J80riPIIaGnjxcSZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f16c38-cd48-4cc0-56ad-08d91d664565
X-MS-Exchange-CrossTenant-AuthSource: HE1PR04MB3146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2021 21:12:14.2172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bLzdXm3bt986LUGgROQMqY8QvzyaQxGxrH+F980H3+0tvjg3aE8N1PY8f3ElOAlq/6kpWRW1DjiWoqdZ0k0Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3260
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

Add two more compatibles: "nxp,imx8qm-jpgdec" and " nxp,imx8qm-jpgenc".
Also update the compatible property to ensure mutually exclusive usage of
encoder and decoder compatibles.
Update examples.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 .../bindings/media/nxp,imx8-jpeg.yaml           | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
index 5d13cbb5251b..5cc7b6a94c44 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
@@ -16,12 +16,15 @@ description: |-
 
 properties:
   compatible:
-    items:
-      - enum:
-            # JPEG decoder
-          - nxp,imx8qxp-jpgdec
-            # JPEG encoder
-          - nxp,imx8qxp-jpgenc
+    oneOf:
+      - items:
+          anyOf:
+            - const: nxp,imx8qxp-jpgdec
+            - const: nxp,imx8qm-jpgdec
+      - items:
+          anyOf:
+            - const: nxp,imx8qxp-jpgenc
+            - const: nxp,imx8qm-jpgenc
 
   reg:
     maxItems: 1
@@ -69,7 +72,7 @@ examples:
     };
 
     jpegenc: jpegenc@58450000 {
-        compatible = "nxp,imx8qxp-jpgenc";
+        compatible = "nxp,imx8qm-jpgenc", "nxp,imx8qxp-jpgenc";
         reg = <0x58450000 0x00050000 >;
         interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.17.1

