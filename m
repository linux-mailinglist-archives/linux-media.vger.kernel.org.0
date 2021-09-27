Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E534D419EBE
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 20:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236088AbhI0S6t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Sep 2021 14:58:49 -0400
Received: from mail-db8eur05on2045.outbound.protection.outlook.com ([40.107.20.45]:53665
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234508AbhI0S6t (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Sep 2021 14:58:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJB0YndKnkrzhrdlrlAeyqGnkYVXLyVmnJGlUYMxbL54LVK8vDdCVtcYEFux7kGiZEh9Qb+wiCbcEOjsvwdvPLgRDEDvhIWquVUluxGrV8iEJc46dM20OJFmvQRe2T9C9043/mCuoqPPPMPnZrxF/FqtcR7IenrnVKhxoIlRf38kmRyMxyGdJbir6xzhEJDNSHhCwcE/8tHWv3tcPe3g2vy7LlPaL0WAEItR4bFs/GwZTGk8PQQUwAG7w34BRVden0IIyK/RmPHqokzilPa355kUESJXEN2Lg+D8OnuwMFcXZy4YFO9fI2zu/WWvXiRldz+DKdfwex8PuqM1vlrgiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=9b8Qj/bO3hj4iUf7/aHRGW5V79PDbVyZT+6VaWhDUwI=;
 b=XQ0zg3DOJeQMR2RR5JYZ3WugWjrRE40Y+WBPLSPepJn/4UuVeESpze4USiZhSaGMmOD7CSJblRBkKSYrbz7K5Rae+XgDqsUt5mm8k2Lh8/l+UFss/aK+3JBhcAYbO5OvJTWgbBgWcISblirA3pf8dh1K1PMSR1ab2RhF21AJMbkTDx8K0GlfnblxRhpnRensz9jxTsfu/mZKDcT1P2MoDcHjpAj1YJJX0iGv5SDjadJ2NlQ7VP6WpJ91tc3syzv8CKwD3r1G5ODnkAw5MR0kA8Ud7yYHFgg+RVYm6qFF6JYnjyBRRO6am3pN4814+a2uz7jbBbnaC1CGJ+cbL/69Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9b8Qj/bO3hj4iUf7/aHRGW5V79PDbVyZT+6VaWhDUwI=;
 b=BF9SD/mDQol5A+h24OMxzjHUA7nASpQdOIjM3HT6X8HS1UQiI1Y3JHDIPPpF8ZzK0XaAol6Mh1+hsPVZp+ITiR5V6lAF7kKOhs6xkYcUCZ04Kt0lC41LLsA8yxwGCV4Vvn2n4n5ggu+PlgFiASx4KrEJhaE9/sklxUqpkJp+1SU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2495.eurprd04.prod.outlook.com (10.168.63.15) by
 VI1PR0401MB2287.eurprd04.prod.outlook.com (10.169.136.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.20; Mon, 27 Sep 2021 18:57:09 +0000
Received: from VI1PR0401MB2495.eurprd04.prod.outlook.com
 ([fe80::7858:1e48:5260:2810]) by VI1PR0401MB2495.eurprd04.prod.outlook.com
 ([fe80::7858:1e48:5260:2810%3]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 18:57:09 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        robert.chiras@nxp.com, laurentiu.palcu@nxp.com
Cc:     linux-imx@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: imx-jpeg: Fix occasional decoder fail on jpegs without DHT
Date:   Mon, 27 Sep 2021 21:56:57 +0300
Message-Id: <20210927185657.3094734-1-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0046.eurprd03.prod.outlook.com
 (2603:10a6:803:118::35) To VI1PR0401MB2495.eurprd04.prod.outlook.com
 (2603:10a6:800:52::15)
MIME-Version: 1.0
Received: from localhost.localdomain (86.124.168.147) by VE1PR03CA0046.eurprd03.prod.outlook.com (2603:10a6:803:118::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend Transport; Mon, 27 Sep 2021 18:57:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2faafad9-f4a6-4986-eed3-08d981e89b2a
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2287:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2287CB88481B3FA0C6DFE5E68FA79@VI1PR0401MB2287.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gYYuzaguKFcL3aM/egdxNjLzCwCcAaBEIOUXSvUtz6fShiT50NJm2fNrrur+c2v7Th17kz3e5ZOdmZgMngKP6yh4arvMhTtz9t91bD1q73DI+hFHkiLleDltBjNCoUDtgE3RI0rlP/sk4MeO+6KHh3SUigx8cIZ5l5ClvYcyTWLpsdz7thKp59ycrvqzim6d+jZV4iL9CfI/5EeEG1+seSiuv+cL6TVeFpdyFcbP4JhV8q8cTmGf9e1dWve/4q+7NSrsoH3TZ3U34yT+OQbFu/6Vh/0fHYQUJmQq83ws2awrtiWm35VuNTzL9EVcO0EYKWU2jjolxS8eJUOi5q7VRJuFOKcM+1H4D492AXGkt5eYoYgkZ8lTdQvMXdLY/I0fHDS6GXR96n1kylQ8TB7++w194y/WQ/zYzvDh5SI1lTenHxGn/WewLRXHnwxICsWkMTu5+q54mEgqn7yQ1iDYr68uhmQYmlOY7yqxycqtKHrttV1FhB0QsodC/K9CzZHzf+49FzdC/8LdVTssgE4tE7AN5T8FJ0VL2cQjQT7+poI5snTDVYOukcefysOhCqcauvSWf5T08v14k2lHq8s2TCS0Z52tkL+Fs14UTlOl8rhobCnJngTyHhwZIA2RxLYYvq5Tl03f5b3bgp195ycIJ4+hnk46xaWLB4p3ZaU13wCbhKlhf1vH+vNdi9/+mYg2pQ4brkqHNRm9jG/xsjhVQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2495.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(2906002)(6666004)(38350700002)(6486002)(6636002)(38100700002)(1076003)(26005)(36756003)(6506007)(66476007)(66556008)(5660300002)(66946007)(186003)(86362001)(508600001)(8676002)(8936002)(6512007)(52116002)(4326008)(956004)(316002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+3+bSM0GpFXiJATHm59V9uLrmqI4BTOCyCbHFWliq13yH3oO3N+6InOAly9g?=
 =?us-ascii?Q?8X7VX44RRuNwfF9SnU0Tpd1yhmYlmVuSnZIv6BDNSUP91uRSJ4JexyJwr5Ve?=
 =?us-ascii?Q?f42PTU+cM16IOaJdeZoXwxEgRLwIvxfjQtSFwfZkP6rVm0ZSd1q7oHFM0cmY?=
 =?us-ascii?Q?JGuRaRYD84yMso58O4lxxeU/i22gRwKPRNmvpVRUnX+y+Nepfr0iO1/RUKyM?=
 =?us-ascii?Q?w0UsuIzkFD/fGAWZelJi1luSCOrtwk8fmHwaBwA6+ItZtCdwjt9aGtJ4EcNE?=
 =?us-ascii?Q?AlE8SGa+lSvqQ1BqDduXGQLmIdBc8HiZPeakw9iPLfQJdQi4Z2x9F0ap28Yl?=
 =?us-ascii?Q?Vgf5kiYD8WIytq4dDrNHpALvrIVriUMg10R6FUs0pXWdCwDVWtbbn6QVnMD8?=
 =?us-ascii?Q?lyqFTYBBuxHJYXJ0+zY5cLOZnRBae5r28Gf3JrYZ/mqSUpeLFTSMPEApRG8x?=
 =?us-ascii?Q?oRsYJYCWhZ0xfprPL2VJqw5Oh8y0nK91r2Y6+FXljTxCem4GZsplwaW2ECuY?=
 =?us-ascii?Q?Dk2w8jbTgBeGs3D1kVE8lX6uNxBtAd5Sp2fER0Mc0A4+Kat3BCydu0XT121d?=
 =?us-ascii?Q?oF6qdDHR+XzBp2Vg/30jjjCfvmCoouYNO4gN6x4hjdvBc9cUe7hZf/OEhluz?=
 =?us-ascii?Q?5Ac9T0z3jLO83es6YX5tbVGvbLVIi+zWfNsabEtf6HDECOVFYjV+Nvw0lp1j?=
 =?us-ascii?Q?0smhNoV4EZspTxMZzUapcaFauGV/9OBoPPYWRRVGdzHdxhk9mP70BAk2E7uU?=
 =?us-ascii?Q?HHSRvBxFj/ZIUK6bfnAWOUlz+KCpJVm12a+PYqCzQF9DQXD8KMdwUeam9DFm?=
 =?us-ascii?Q?8qc+MhkU5T56J7Cm7ayGhQBNkJaA8eBpU1FWCkBj9uKOssm6XPXGmlmAYbvL?=
 =?us-ascii?Q?k5cdJl3ymLst/4cBev+yYkaz3HK/LHdFSxzEmBLLO0Ecfs6MBhPnNhq56tZH?=
 =?us-ascii?Q?22RX8gwphnhtfXEYEZi93Ky9C4uIGLuiAhPGZwWBke3jcX0l1daUWf8jd+RA?=
 =?us-ascii?Q?3YDNY542gTHaU6kzJ31c5C0Tq1Q2Ql8z8XffdIv8nlYpaiqDp7kzpymsroHT?=
 =?us-ascii?Q?/m4bacvWS78hbPFhtHzU3E/gV24aSJSMyyxEWdyeRw2cKw1xNTXvP4Pjc/tb?=
 =?us-ascii?Q?ItlKnzMLRCgZbJWbWEqUeAa3nyHChDHxPRm3gybppmo+NINLJqTf0bg6oV+9?=
 =?us-ascii?Q?GkAkkoARmGPVaFy6buOI+6pPUoznAyAGVyi+nf82dysV8szCzj0hnzERLMUY?=
 =?us-ascii?Q?Hr0kYsshWDAHx8q3w4OGFN+q045bA3Ff1CNxllpXz0EBcdwDnRvymX6Aeu7w?=
 =?us-ascii?Q?QX0X2B7wraFJNzxokhmqkreG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2faafad9-f4a6-4986-eed3-08d981e89b2a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2495.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 18:57:08.8642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K6qnUu/jTzVGDt+NOjy7IfoR5HWynM+uSxUZEEhsQcWUkOHNkpeTqoMKkQevxEs2vTbkODGe2iJqMRiIGwGFTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2287
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add some body to the dummy jpeg used to inject a default DHT.
Use jpeg_image_red as compressed image data, insert it at the
end of SOS, before EOI.

The pure dummy jpeg was occasionally not working well on
8qxp C0.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/media/platform/imx-jpeg/mxc-jpeg.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
index b1678f94dccd..bd19a4b1bf08 100644
--- a/drivers/media/platform/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
@@ -283,6 +283,20 @@ static const unsigned char jpeg_sos_maximal[] = {
 	0x11, 0x04, 0x11, 0x00, 0x3F, 0x00
 };
 
+static const unsigned char jpeg_image_red[] = {
+	0xFC, 0x5F, 0xA2, 0xBF, 0xCA, 0x73, 0xFE, 0xFE,
+	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
+	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
+	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
+	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
+	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0,
+	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
+	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
+	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
+	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
+	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00
+};
+
 static const unsigned char jpeg_eoi[] = {
 	0xFF, 0xD9
 };
@@ -765,6 +779,9 @@ static unsigned int mxc_jpeg_setup_cfg_stream(void *cfg_stream_vaddr,
 	sos = (struct mxc_jpeg_sos *)(cfg + offset);
 	offset += mxc_jpeg_fixup_sos(sos, fourcc);
 
+	memcpy(cfg + offset, jpeg_image_red, sizeof(jpeg_image_red));
+	offset += sizeof(jpeg_image_red);
+
 	memcpy(cfg + offset, jpeg_eoi, sizeof(jpeg_eoi));
 	offset += sizeof(jpeg_eoi);
 
-- 
2.25.1

