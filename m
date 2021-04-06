Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38BBC355A77
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 19:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237017AbhDFRe7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 13:34:59 -0400
Received: from mail-eopbgr80044.outbound.protection.outlook.com ([40.107.8.44]:18083
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235301AbhDFRe7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Apr 2021 13:34:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSCSbUHzp9O1Ir+pcoT91IAUUttOBRwnchJsXHCAPkyS5LP7aFq2llzFtUGuDilczniNhnGc3yzTWghFwGlDxxMWrU3+3Ok6mz4QlkqGYWXVNeAXsIdcWQXDiHbPrXx/lgOBe3ig1+bYiJXGerQLJ3iC5P2YIPebU53OIOr0qTN2nMUfZWLLMqt7C6AQapBn3wiCDjV/K24N2FrMruLMw4dmQxf62vvPa9X7w/rqtV0VxAVC9ZbC2DaA4csUtrzD7v8nHssh6bsSR6ju2YAJ3dm0kxncV7grWhn9YZptPgILUT3zxC+W95HzLE8dU2EhCKNxID9HTCwKAh5n/xt5FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVEwpV3Iwq8fw4jadgDzeAMgjWxZo6y647OGVAthkec=;
 b=AfItSf4lZK1QyvpkzVNysY+ftrF+Y1s6EShXqvkDX21DE2RdNYyYU4Q1GdwV2+yKqRR6P6K2x9LdSpM2gGnpLMI9sYTgFQmns82O4ADmlpV7ALjbUPM6fxxWbJGbogIkXgQpJxNohsGEpiYTYkjEnlpkAAwE0IgV86svuYG3mYrRFewQC7G4HxRLsXnXgmOumfiMKBiqQcYEEBk0C44g8NJ/5/aZcgtxw1cQQBoJWFoXku6KGDAFMR5Yl9p2iXpuIY59WMMqU1U//lWRkvuHitvQTk8ZnGDACZFMDVC4fZRVPKdaUDQc0pOQawr7t41J+ELQNErPjRpZBOGlG8KaVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVEwpV3Iwq8fw4jadgDzeAMgjWxZo6y647OGVAthkec=;
 b=K6Qbk94StVDXRIQ8lSuEauW0CfPblnN2lVMmQhFvPbdChA9QVN2b9QqNb58v2eXf4W7fqcU6eZ/JWbqhDVlh1B9WvkaEqVoQx6+tedYjW2tzokXNkWNztppGL/VY9QVMtwbtocAQlsLvQsiyhXYWzOQQvob7YSrk2xpiVChpUQw=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB5320.eurprd04.prod.outlook.com (2603:10a6:20b:3::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 17:34:48 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::15d6:e539:4f60:d7df]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::15d6:e539:4f60:d7df%6]) with mapi id 15.20.3955.033; Tue, 6 Apr 2021
 17:34:48 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     linux-imx@nxp.com, linux-media@vger.kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH] media: imx-jpeg: Fix double free in mxc_jpeg_remove
Date:   Tue,  6 Apr 2021 20:34:28 +0300
Message-Id: <20210406173428.19283-1-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: VI1PR07CA0283.eurprd07.prod.outlook.com
 (2603:10a6:800:130::11) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.30) by VI1PR07CA0283.eurprd07.prod.outlook.com (2603:10a6:800:130::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.8 via Frontend Transport; Tue, 6 Apr 2021 17:34:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70b65023-dfb6-4945-8e5b-08d8f922467f
X-MS-TrafficTypeDiagnostic: AM6PR04MB5320:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5320C7DF6453AB2D47144558CE769@AM6PR04MB5320.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G8ijHvrIItu3hTMujdzQbs6HMJaIpt8leUusymtK7+HFFkT04S+XQuY2wfqrENXrTAnFlzcbtprJYEtj6kNmMVxtwNejxRA242O6c10N9bE38RD+nS0Z6p7nsoSFvM6auEEKre4mOS11HZUl5tFQ2XQjC2dN9ND6fu4o48Kj3zdQPzlzeg0sRDs3wWkKDLGaAEVzTUFhCOO/8aRKt+h4DfjJbc9DCEkObHItZMjTEjgYd/gZbJx/SemSdtMk46raf5WPerexPpL9ow+JNWWGFkIjL1S9LWy45T5V+KWwUUzSteb0rKLBDMUNIPDFwA+e+ECI5ASCWAirSqzwq+8r5bb0YLxPjGalqft8q8AzK4YzN1X+PGxwshzblFpzcFuKPfqDoJjJ8adKshcZfC9tApQIJX/EwgcMMC23D6lh+W5lpwwhnrHKl2isKYgDINBsttRaqlV+yQHDjYWZ/Y4C6MP6yib1vf4Eje8fsk1DVWnwlrYq/3Lcbg1G3fXkBWcJn7lpCTIOmDYVdb8asJ6OwBkT/l0GFAB5745vU2OIZGAewktgFruF7y2J8x33r9ex9nhQw5kIERy0TNcE4JMM64vPG+Tt3wOlVa31n7iqdd+hiyVydgo/+HSIACoShhOlQ1TfE1fqtYp+qxcBcgzIVaRZoolC4YLlbSt+HpJfpgI5ydYCurlnWsLSDOZVbUGJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(366004)(136003)(346002)(396003)(316002)(6486002)(6506007)(956004)(16526019)(186003)(66476007)(2616005)(38350700001)(8936002)(66946007)(38100700001)(26005)(83380400001)(86362001)(2906002)(52116002)(478600001)(4744005)(4326008)(6666004)(1076003)(66556008)(8676002)(5660300002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RF3bZlynJrslvvo0kWZ+Xq41QG8Dn/5VrDq6DnXP5sezVcI/UGSEHoZ07mii?=
 =?us-ascii?Q?0lr09B7ckATl0vzlQVUGhDtNOOC/Kymqe2hoTwKmXzpCUQMsRr5RbO5cYPVK?=
 =?us-ascii?Q?n2Bf0wcZxBxXQm1BBl1BPOEnM1Q2Z5AmUOLon+VUF4McSAv6ND/obXJEr/8/?=
 =?us-ascii?Q?9/Wq/XXEmpcryRNHsN2xJghRpja7kTYOhEOot94p7YY5wVXQ18rziFMm9tJN?=
 =?us-ascii?Q?cea3X2XqNBXxrPUkqRFpsT24xNKTEy7Ly0c9uN5tFaEsTUU4mCL2ooIbIk0R?=
 =?us-ascii?Q?3/arOiVSJ5GPahsO2hrCcJG1lb2gC7BngTOgQvyUn07Lbe2t9d0jI/9IbLYQ?=
 =?us-ascii?Q?qxSlAwj6Dw51X0ADdXwNICuffu684rTsJN+Tf/w3Je0x9AfESBG0GKCMkKU6?=
 =?us-ascii?Q?p5GJc9EYh5Mc3DZ+PzwlSyRq1T8JtFgjOXj6y7FfaKIHKbsjP8LGw9KepQMs?=
 =?us-ascii?Q?jt4e4E+HDwpzs4lAknDSKeGlEdIafNvlentvu5THVzaSVvbE5jk5fJeHCbH5?=
 =?us-ascii?Q?mJbaR5I9+S40R/W8JplxH5GLaGhuMLLVxjxZ//hhMkGHMjDbfpz3RG86mZ0h?=
 =?us-ascii?Q?EiGD2MtJGxVe8tfl1bLuvqQK3ddyNfUCGGaaOrQTrXqrYdjHIPG2WLGnJ8Qd?=
 =?us-ascii?Q?TFXg20OXmku9C1CSKwUqtYd+BLyalmYNRyxUKEKk6MU0ZMjNgms98RwDOqeH?=
 =?us-ascii?Q?RISv29Vntwl9tbazqCqLNDI+wkWGnSYvTRWpRbK81d0cALo53GOXUAD2/BMw?=
 =?us-ascii?Q?AisjgRRfgEz2NJU3YSMCF2NtsVgDGqfm42b2wp5RaNoapCl8ix5y1yNcCeyb?=
 =?us-ascii?Q?kEg+mSAlvGk9kuUFq+Ckig3OFmD2/GkIExQDkXCcBJGD5J2zLqLsoz3Zm+Wq?=
 =?us-ascii?Q?7n5QbD/xvlRwRYQwusphwXtGLXBqGQBhzkRvN8lwn7y7chm9erv9Q//KLgQZ?=
 =?us-ascii?Q?mq1N8Q7aMtNC5eO251KL8O9ImJm1IAiMBnR/GswDwZR181C4s6q/7Pt5RDUl?=
 =?us-ascii?Q?kS453v4aulkYhKdig2iqrYNF1Vi35zGwTspmloHPEZwH6JoKZaPZ8dhuJiWG?=
 =?us-ascii?Q?KTpN+r8wabtT+MNqRbiTW6OEBLhCnGN4kdyCJX2TqpcTGk7+bXtg+noCnEm2?=
 =?us-ascii?Q?Q78bAzkeMJmBMp1O/4OC348ByxrBgJr67IxQvFuE7bKDBj3X3ssp4zZ9qRNX?=
 =?us-ascii?Q?8SZc+k+3LPcwgCy2Ew7KaPTBe7PRMVq0aFgvY6Z0qSFlXsDwviODHx4w77sh?=
 =?us-ascii?Q?BvjktI3ewjghRAJBSIoqDq4UiSwmZg/7GPJycxazI5myT+Tx89cnhnqhF5ZH?=
 =?us-ascii?Q?OhJQ+sH2NMg2QIC+2sXFizTN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b65023-dfb6-4945-8e5b-08d8f922467f
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 17:34:48.2002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/O1bIl1DBF+G5XfMl4W7BsnSIbfWz1xuSqwCzOOOl/5Fiat+3bXle4w0HQ9wmoSA4qtR/6MTt2MZR+9UY6s8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5320
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

The video_unregister_device already calls video_device_release,
so remove video_device_release, to avoid a double free, when removing
the module. This showed up in a repeated rmmod/insmod scenario.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 drivers/media/platform/imx-jpeg/mxc-jpeg.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
index 2d29558f1864..ca1b7e8c65f4 100644
--- a/drivers/media/platform/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
@@ -2099,7 +2099,6 @@ static int mxc_jpeg_remove(struct platform_device *pdev)
 		mxc_jpeg_free_slot_data(jpeg, slot);
 
 	video_unregister_device(jpeg->dec_vdev);
-	video_device_release(jpeg->dec_vdev);
 	v4l2_m2m_release(jpeg->m2m_dev);
 	v4l2_device_unregister(&jpeg->v4l2_dev);
 	mxc_jpeg_detach_pm_domains(jpeg);
-- 
2.17.1

