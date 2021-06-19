Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB433ADA6D
	for <lists+linux-media@lfdr.de>; Sat, 19 Jun 2021 16:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234452AbhFSOjI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Jun 2021 10:39:08 -0400
Received: from mail-eopbgr140047.outbound.protection.outlook.com ([40.107.14.47]:21602
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233240AbhFSOjI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Jun 2021 10:39:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZyhTf+xe1teKD+NbzlHQoq0xSPCHuxUrdHasqDBOajxZck+rwuZUNnbPXfDIV6r56yxd5eJPcX9l2xSf47a2ZNEZgBMzozR3nNxN1Tkgw8qd5B0PXIHHv3YruDcP4tfYoNOOlIsfBRTQA14Rts6ypLVdUcA0HJ3J3rTznekntgaq3ALx2DoqTp6NquBB46zgJrachiW+OomnTpM9ZLZGNX97IxDpHm7/MbgfTHMAenEEPUUbYJqZ2Qbd7aZIzEhUBXr+ULof4RiyGf5rCYS/2k5w1uBXXxLlZGjIh8aYX1yxhyJGGcf7lYmj3Tu01eO7DbVy1MYrqOXl96yH3S+6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6yYuRMDj5PxYumvYAjBqG5am4AHO/Yb6aif5+a/5Eo=;
 b=ApxiiWUVtLLdStFjE/f29T8BV/vJBX88+DGiUP5Dkt7K3kJYVh1z9ISmM/Wv/PwB2Jbfg+wPIC7tp3SHFR0vC9NrMNNCV570TSqwnZtQk8Re0+aumln+iXnK5hrUhvwZO1rrEecc7ly1uNSnXj0hAGunmnoQ00CVbqBpAGKBTHqNz4DpUmuxuTgQk30htQBtZm9/9Zo+pzXhjiW6byjM8YLCDlrxAcwmaJkE5G9PCoPuLrtCvMyZVuq0TyCHeznKwa2SEqc2jfra95Sy7giJm0iDY399EjRaNVnN2Xig8W8SmUU53s8fLnQXS7JehkptzTQkQt8odt/q++QPehjw/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6yYuRMDj5PxYumvYAjBqG5am4AHO/Yb6aif5+a/5Eo=;
 b=BcvbS3+ElCMS6dY/cFIH6ywYtHyn4QgUfgLTbt6Hjsm7EF9zfI511LzS9JAyE9WzbBWpbZj85z2Dt9ic4KwlxoKIb4jb5y7L00g/g6IxLz5f9RQZTsmME4zwwspZ7SohrXmAwHb+kB9n+k8gr3Ik8vOs3GtkDEtcy9oTQeA+yP0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB6710.eurprd04.prod.outlook.com (2603:10a6:20b:d8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Sat, 19 Jun
 2021 14:36:53 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::bd06:5847:5090:2a21]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::bd06:5847:5090:2a21%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 14:36:53 +0000
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
Subject: [PATCH v14 1/2] media: dt-bindings: imx-jpeg: Add compatible for i.MX8QM JPEG codec
Date:   Sat, 19 Jun 2021 17:36:10 +0300
Message-Id: <20210619143611.17280-2-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210619143611.17280-1-mirela.rabulea@oss.nxp.com>
References: <20210619143611.17280-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: VI1PR07CA0214.eurprd07.prod.outlook.com
 (2603:10a6:802:58::17) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.30) by VI1PR07CA0214.eurprd07.prod.outlook.com (2603:10a6:802:58::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.9 via Frontend Transport; Sat, 19 Jun 2021 14:36:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce595160-6851-4ae7-fcd5-08d9332fae64
X-MS-TrafficTypeDiagnostic: AM6PR04MB6710:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB67108C212C41F25212CE5803CE0C9@AM6PR04MB6710.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ejSlfQbPtYRISfoc4VMpsF9CYL6lMfVkWCQO9YJYKVNIQy7GgCern+ywNPH7BBavhFmvQ83KZWFcxWxdk30E9tqcvagQOjwaxo/aOD0dNwgY0wS1mFNwgOzIhlDy1SX7m1qQsILcYAfSXDRZkCZoeN+1MSN+2oMhE9c2V/ua51ZQ2Y88r/IIkj6i3MC4lo8bSNrks8rTg0fvMYgXhAbdhqzMNqz9cGEnBrNT/iheBTSE2LBeBlpa+DNoqSEWtrjt2DNs4pJba2LEKv58nrGWu0WnUd22/R9RZJxX7F7Q3TfKkpPnlW3TPJlBZt5erPInR5iyc6rXqsRv/meV/fAJs1DvqWlHm3a4i8/NFjOMOj8BlxN0/bKaEQ1fIjOO+6mqca2epz8Q77ylWE8IIMPWJ6YkXsbLWUmeeHFXVwBh21uebwZ6mWg2tbw75heTyWyFU3HNjIOQkeBm7Recs5mNxYACnpw5msiZwSvlqsGE4wtUnu6WWnlGjCcNqBcsC5beCjMTUa3zJBme4WWUrTUCfEfvaSTXKqumxhcWFNymYB91BFqbp+RonwPyR8EHSGlxM76+w9kp5y6bRR9+f9zhCdDbjRQbW9H72T87+xizlqex0oNASay/RfD9uC5OK5/KqWZi+MlYfWd9GKee27wEOxcl/B9cHm8lcP/dtA3k/1o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(396003)(366004)(136003)(376002)(86362001)(186003)(16526019)(6512007)(6666004)(8676002)(7416002)(6506007)(38350700002)(956004)(478600001)(52116002)(66476007)(66946007)(2616005)(1076003)(66556008)(316002)(4326008)(26005)(83380400001)(2906002)(5660300002)(6486002)(38100700002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?deyf7ksHLvgYyz0MT627HobZaQj57KvW78mdQfvi6yF+MhMVGUaefK8Ja1xS?=
 =?us-ascii?Q?SFwIeRgQWZ6iqhF8w0gq0OrsiVcl3lvSoyKTlc3e2GY38jwFQ/LjSQGCKb/h?=
 =?us-ascii?Q?c/OvDvqvc5mqVBuqpYyympy9SQgk1vtlTdqdZkweRcM5CgOoltXwtAYuZJqM?=
 =?us-ascii?Q?YASt8g+Zff4/ard5mRR0V7ijNTB8xL8ETXYeTnrLTnLC5y86R4gJEvvHUOat?=
 =?us-ascii?Q?yYW/k7zUPcwkWXdPdUEnum72AXAkxVUTU3zE5G35C0OBqkX3ad/rdLuA/2se?=
 =?us-ascii?Q?nPO0e1w6t2mdAdrkreyRlCu2spZplR1A7kojpOmn3mknhGX8rnFeH6ggZmZa?=
 =?us-ascii?Q?pax7eqaUa5zvYZCM9Abp940bd9YGQCXy/p5/RGIL8cpWaZKsa0HFkS/q6/GG?=
 =?us-ascii?Q?0nCDDkKue9qhk04cIErcxP/91V3IgCrYk35Wf4dGkm+aDUO9FlyXuE4pJdwo?=
 =?us-ascii?Q?eUNfDkTJref4RRR+W/V7mOuhkTDWckzOcukWDYCQJhWVvqlMfctb52TcklcZ?=
 =?us-ascii?Q?8Rw3e7dt9O3CWgGRAGtEs2ntiV+boeoj4hdFVFZpfB4UnoRyltETxzvhDSUY?=
 =?us-ascii?Q?t4A/5YNvTnK4iebNGYW/iRDNfYKxXqxgfJLQQzXUdf3mWTOeRpnePDSmJKcp?=
 =?us-ascii?Q?itjld3aV8Li8lR3dzRtOlaFyylIHziZ5q+URfqKXFaKa+HxJDhFK7J3Ht0UP?=
 =?us-ascii?Q?LEAHYMmPUXwUK/6L2F1PZ9IdfgXzawu7NBNc+beFiU1HUF9+BVnV3rlFCdfH?=
 =?us-ascii?Q?Xcj8euk2gvAKJ021FufTp0ZilpHMqdalCPG35ebMs7Q4sierBaEOT1JNYzZ1?=
 =?us-ascii?Q?s7aerLGqTU/FMnN7NZrSmPN3HQpEilfly0zI4a9cXAkpL0ZUfzqJdxxgPqVi?=
 =?us-ascii?Q?2lIIs34206nLM2MPk7FefsQ/fcY71lHwyvpdYsn4bf0zT1/bNJZTcbprP6Ak?=
 =?us-ascii?Q?S/vy5EIq3ywHfU/JhkX4Y1E1FaZVO6l6hpaaWnFnNmVNN3TagWw94sTnATNG?=
 =?us-ascii?Q?puFF0sqyu+Sojqkn36NZsMyTJXPyUdHLCAPrIsjA8NhzgEmAIq2VuWNWxmIP?=
 =?us-ascii?Q?Y/oJiQg1v3lXGusM0SCsd/X4cuysH4nyAiG61UTk8tgZe3g4hvyUE9BhZr/C?=
 =?us-ascii?Q?MIlXRx+x6KaGUeGuKzZEV6vaRZctMUfkRyaA9K71iIi5jpEVVHX+fyfc7XWc?=
 =?us-ascii?Q?K0AA/Dqh1C3JpVrjLr+CdJXL3mFMSueVuXgSBWghDLS5pVsKbhWM4lY7+zjJ?=
 =?us-ascii?Q?0a/Tlb2OHkk0OaHr11y4VU3whasRHC1L4eHfCrpSJZV3y6Ny8L/G8BmThn7i?=
 =?us-ascii?Q?gN7ikltkrR6A67WANuShbQ9e?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce595160-6851-4ae7-fcd5-08d9332fae64
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 14:36:53.4068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ef+9Siz4wcOHLYtERTFRJ663nH/rzKYsss27yV5k+1SRZCgWlJknCYrYfult0nJi5+FQMQAwfmIsBeVbDTjyKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6710
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
Changes in v14:
  Address feedback from Aisheng Dong, do not use anyOf

 .../bindings/media/nxp,imx8-jpeg.yaml         | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
index 5d13cbb5251b..3cc6f42aeb76 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
@@ -16,12 +16,17 @@ description: |-
 
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
+          enum:
+            - nxp,imx8qxp-jpgdec
+            - nxp,imx8qxp-jpgenc
+      - items:
+          - const: nxp,imx8qm-jpgdec
+          - const: nxp,imx8qxp-jpgdec
+      - items:
+          - const: nxp,imx8qm-jpgenc
+          - const: nxp,imx8qxp-jpgenc
 
   reg:
     maxItems: 1
@@ -69,7 +74,7 @@ examples:
     };
 
     jpegenc: jpegenc@58450000 {
-        compatible = "nxp,imx8qxp-jpgenc";
+        compatible = "nxp,imx8qm-jpgenc", "nxp,imx8qxp-jpgenc";
         reg = <0x58450000 0x00050000 >;
         interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.17.1

