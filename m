Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBAFB42BA65
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 10:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239023AbhJMIb6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 04:31:58 -0400
Received: from mail-db8eur05on2078.outbound.protection.outlook.com ([40.107.20.78]:6081
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238992AbhJMIbs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 04:31:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n41Iua7EP4HcG08/he62WmoNpqHYgjSqzHXAuosyZJmHueW934sB8OEIj4Hv0i4nDN0ZoB8UQ0WzkQIy6r9Nkns8lpvdkn8D+p/KsWeo3H/hRUKIeYevAGppPQm+ks3RGAjbqsnZe9hrftl55utT6ruTc+U5CgUweO0pb/iCVb9Bq0vQ4s9cpTW60MYZqS0VllB31RrTpAjyP+rPJkmcHP5XvJ19NQWP9shmM/3uf/dro4fBZHTmGgzpx2irvdOQFa+L2BUQHAfwZSwJPZkV3d+JP0YzPr+XNCSrDq5PvK8bMvqJSHP0+OwwH+kA19F18frCDmAwCxIiayunl29jRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7mS6O1b1O0KcJd6h45R8QJeIAHXl3SnWsN2qGrDDEA=;
 b=eOpqwhybQX6KwY/QcIoSAKoHmlsFdlwndgDvJm9JxGWnoTApe2zOLEptgaj3jLOnZPK41aleN0+9AB0AyhqbCiKu7bB6Ly/FmID+/yb2J9gyYfq7i4VUdFayOWEwDFXlVENKqcoDzq66/bLAXEMQvjhXa3XJ481I9omgLMBS0d06M3wZLgjlGqVZb4j7hdMnEdMtblQLWrb6VlC3RzEQ0BRofoU9kz+yrIrUhAhfUNJO/V2ExnUucbagEA/Pl/iK4LdcXYgBQKxpS/kKOp3/26NY5LcwjT6Q1JvIdw8ZzpUvofJAFKrjnZCxJ51GN0PznxdaHw0eQr4rmVSfGJgmyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7mS6O1b1O0KcJd6h45R8QJeIAHXl3SnWsN2qGrDDEA=;
 b=j53X1JuVwyNMdK5JT3VKLwIejzLPe4H1tbKCBDMzWQ1oDY7xo0te6ZKNhopnm1nhgbANg2znIa0cEwIgdZ+x4nqjbCyNdINyRAyDvn+2wjX/QwqULOLgQ4rwZMRzXnsXj9oJoMvpVjAIts2DlcEAjZnGK1TvY3QraBX/Ze6nVIE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4789.eurprd04.prod.outlook.com (2603:10a6:20b:7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Wed, 13 Oct
 2021 08:29:20 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 08:29:20 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v10 13/13] MAINTAINERS: add AMPHION VPU CODEC V4L2 driver entry
Date:   Wed, 13 Oct 2021 16:27:29 +0800
Message-Id: <2ec6ce88ddfcf0e61238bfb0f5bbe53e5ff02b2a.1634095309.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1634095309.git.ming.qian@nxp.com>
References: <cover.1634095309.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0121.apcprd03.prod.outlook.com
 (2603:1096:4:91::25) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR03CA0121.apcprd03.prod.outlook.com (2603:1096:4:91::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.12 via Frontend Transport; Wed, 13 Oct 2021 08:29:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 092129b5-7881-408e-f51e-08d98e238d8d
X-MS-TrafficTypeDiagnostic: AM6PR04MB4789:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4789A9745DC79B5C15037CB9E7B79@AM6PR04MB4789.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xdx+uruvsQaA4y90wUSrFGgQhXQ9rbV9dyqcl4AAzPZwNNAt1ZllKgFh3ee31w7uDY2enBUqq/0BrAjSzlL3S0VTsa+Q1dWdcQjre62tjFnJKFCn9YewSbi7xAQWLlmnY9T/217z2J95eRH19xeCjWICZJ4+/9pRhPg49zgQogwtVqAPl1lZh3SBKNgLfuVplQukUe5F1QnrnjJ4KboAsKJyBAiGr9WysL/0B8ZBDM3VNokSZ5o0X+lAE2QUqIPBW/1OafmIqKtoMPJ5GSJcaDQ3gwrwoSzMIrtTwtQksWsmlgZ659fAg5LYbHwIQZVEEMEL1G6SyeD2v2gZ7e2FEG38s5VuE5nggmty1ZQwei+2g4WXiW7QYVKka2oO+KtZefg4VOKNKgVhcaQdqTq83vULKHauP6inqKWlk47wMxq/mi8eEt1Iu4BG/Ag49xE75TgjiSVk7ifA+KAkklA4GTbe1cGUL9hjAOfuvCevShElL+5umPx5NYzn7Rj1wi9B8YM350/+Kv/7A90enVNdGi0f2f7TXvVWZH/R4rssYlM1tQnuTqEU93wOimmEc0Nn2HEQmEPRhRnf8CART7/U7VM5SpRMeN4Yypcli8wQXLCh+gGlxi0ii1lkZmdht6qZvfcsKQBSTNQsUZuFlIOMygpL4Rj+IpWKxBLMohRI4fW3V+twajOzcyX912OsRqXqKi04h4Td7nfcs8IVTRK/hg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(36756003)(186003)(2616005)(66556008)(66946007)(26005)(956004)(66476007)(6486002)(44832011)(316002)(7696005)(86362001)(4744005)(6666004)(508600001)(52116002)(8676002)(4326008)(38100700002)(5660300002)(7416002)(38350700002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a6wAYRsKTJnYw/Q51jX4uXRp5lKrlPsgCuB2PTXx4su/5ZCXpmeY/Qiy4/eG?=
 =?us-ascii?Q?nDMdMU0KjDszMAgdHNmbO4gJbMSm69bnHp2HUbn+t5cCx2E4X76j0+vQ/zFI?=
 =?us-ascii?Q?Hf1nCcEZRBAuy7fuo4mdWQjlN9+AZuaEDBYonpfRrZXmgjzq3kHcHq6MUOZs?=
 =?us-ascii?Q?TeeNB5xBDuN1tUqymP+CgvbmExWE92jUoywDkQ2xPExpvtOYncp1QCCHdh8n?=
 =?us-ascii?Q?449VJ3Y72S04mmtHCWMKOr2lnYEfDTATbH3tcJqaPARZikjsn0eW5ItRswK8?=
 =?us-ascii?Q?LaN6UrABP9YHqta3dMmtRQN1KDPVL370yCErhx+6akj/2fOfiBa3CGgrrP1R?=
 =?us-ascii?Q?KQMKTA0RjVt/JKOTccghB277JhXlrBP0ym3X7RtKNafT5jNuaLfvbPGhR+tX?=
 =?us-ascii?Q?jSu3VZXHsdTT4s0RifbGbTLsqfKJZP0P67GVVwhOj91gQthl/V9fEMC2PdG9?=
 =?us-ascii?Q?bcdTnENHv5Ma7o6QhedGWb8f0/2jhWE5JJ6p9j1lz3phVj8k+QwVeFw078Kp?=
 =?us-ascii?Q?PUk+lKko6LaKnaoFvKGlqDN1MK7HxvZ71TG7W5Y9nGmXxPcjKmKPHhME8S95?=
 =?us-ascii?Q?rCpUUwVQLP3hje6O1UAhV7nlHBNXtECwf4VvZ7+6AL//r3zpkrlre/EYzR2S?=
 =?us-ascii?Q?A5LdH33CR0NilIpLNH/k6pAI8i19UYoT5gF6eoji5ImUVp9iRvI3zA4QLCFr?=
 =?us-ascii?Q?v1/YbrVrU3f/XYkgUWOZP2t24ro2TQGwvSVlJ9RcZAk3oMGL7VC0mSMzND/i?=
 =?us-ascii?Q?dhGjA6AzW2g9Y2AogSk0lWNjvcXcVk26RF6eIiRl+7ek4y1FWOgbkYBGtJnm?=
 =?us-ascii?Q?doZWgReYXZisBMl6nsX7RYlYHcLOEccXEGU8ZIPTQ3Qza61Mf6rXVnnL6KCt?=
 =?us-ascii?Q?Y8jvVbVsS6McDwCgjt0rpuu77MgtAKL4qicM1C7WoK31c8eKd4gvwUXkDX9j?=
 =?us-ascii?Q?D+65ZzIlAnIynb/tPes4t0rz8/dmH+/mL1fqoUf+379oTvfmNy3v1orVIRY8?=
 =?us-ascii?Q?1mFprYDse1T04ymZBRd34+8dws2O9h6ypOyYOEJjd9EDb1Ikxstyp+XkvBc8?=
 =?us-ascii?Q?tVwAEho/JbQfh13ZNUJuNpZoaGeZRxRVjceolCysr/XkORz+8L/Ed3W37uJ7?=
 =?us-ascii?Q?AWeS56f25E9utwNnO7w4s9k5yCxae2jTJgbWbryrqfmwzHuzznqqHvyQwMFy?=
 =?us-ascii?Q?6Hb9IBEQ7b+Fn/jWZ4hX4+yRoTpPJxvNQx8VER52DJ5X5OolsET6E3F2//h/?=
 =?us-ascii?Q?g5ziAq1lGAk/v9GJpGJeFuS4N7geomwp2HMnU1/csE3IoO9YsaxfVJGZO/Yk?=
 =?us-ascii?Q?qUzif19Z+mvlz2x7FGetEbPV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 092129b5-7881-408e-f51e-08d98e238d8d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 08:29:20.2334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lyu+fP7XoMX81O3AkC+0dp8iI8mOLUI3SYhzC7hjKZTrutwfMu6Gj5z7QZgpcGALl+FIuIOqaMmA0paW4kyuJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4789
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add AMPHION VPU CODEC v4l2 driver entry

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ee91c5472bc1..f35b746cb46c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13533,6 +13533,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/imx8-jpeg.yaml
 F:	drivers/media/platform/imx-jpeg
 
+AMPHION VPU CODEC V4L2 DRIVER
+M:	Ming Qian <ming.qian@nxp.com>
+M:	Shijie Qin <shijie.qin@nxp.com>
+M:	Zhou Peng <eagle.zhou@nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/amphion,vpu.yaml
+F:	drivers/media/platform/amphion/
+
 NZXT-KRAKEN2 HARDWARE MONITORING DRIVER
 M:	Jonas Malaco <jonas@protocubo.io>
 L:	linux-hwmon@vger.kernel.org
-- 
2.33.0

