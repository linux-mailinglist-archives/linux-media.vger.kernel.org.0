Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 130182DABF4
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 12:28:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728774AbgLOLYK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 06:24:10 -0500
Received: from mail-eopbgr130055.outbound.protection.outlook.com ([40.107.13.55]:20100
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728812AbgLOLVF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 06:21:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYqSBuR3HAYoVxEkhxcfJmJ3yftaD51jOKveIP1vnlrPYrsWwBM0atVohHsYwP6BR74a0E0sULGDdQvUktqgr6PZ92UsAcs6pNTL/UF4a3Iyz9wCza2EuOHuQtnj52DFnZD6SlM1Inuq129v/nK838F/obBNrQ/rknqiVcYuL4dsIuYriAIe9Xaz3xQa1XhH4z37PSs4Tj2ogsProPdeJGFqVVaWKiocEQUFmTv/U0TpcZE/d4JObOEIqPp0COzoiFyeectNpXgdbG8DO16+oTRqYti0FQMsvMECpI6ihm+qGa1+MWJBf1mWQg4z+bAabb3RzpqjQyynapgqoA3etw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLcGVRn/FCghn6VMNUjlH/UugWflyTysZAvWQStXAyg=;
 b=TOBKL09z1q68XFCQRu+J09pk0mlkJSveJrwai2jYjZWTLpHlleV2hmlbiJch+l27tJNz50RmXuY8ryAGOMOwnOJ22Z9Wvouddvvs1Nm0mkb37JPT4GpFqYjtOsyCbkTfkpuKRTQOXs7IHAZ3ARhCMUDRT/3Xz4fcHWvw8ZEMK7iYURTyXtpUQLTbkKy4dKuounlFzzW8pyD5lq8mI8Ee/Xgjti769An63c5T60k4kg5/gMczGAI7maCst4feT2ntKiXbmjTnCcC9SGuQFGzGN79bPbn4b7vgH7pDH6ikXLBAn+Vihor/FS42mD0PyiIREab5PKencglMN9fjUeLrgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLcGVRn/FCghn6VMNUjlH/UugWflyTysZAvWQStXAyg=;
 b=Ny1xJEdjsuIPFAETvkavRo47GuF/Dgi0NgCEbhcedfMDpRj46r/nBYEUt4WL33i7ts9hC+siC2ySLjup3PQjfHSzHp3oJwH0Uvm4L68+DIb+uDoA/ZmDmMFKzXGWsJvz5GkXQD51fox4p70fAz7vfDiyjSKk8KVeGpsgXixsdb0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM5PR0402MB2737.eurprd04.prod.outlook.com (2603:10a6:203:95::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Tue, 15 Dec
 2020 11:19:29 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3654.024; Tue, 15 Dec 2020
 11:19:29 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org, p.zabel@pengutronix.de
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, ezequiel@collabora.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH v6 5/9] Add maintainer for IMX jpeg v4l2 driver
Date:   Tue, 15 Dec 2020 13:18:39 +0200
Message-Id: <20201215111843.30269-6-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215111843.30269-1-mirela.rabulea@oss.nxp.com>
References: <20201215111843.30269-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [79.115.51.151]
X-ClientProxiedBy: VI1PR09CA0178.eurprd09.prod.outlook.com
 (2603:10a6:800:120::32) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (79.115.51.151) by VI1PR09CA0178.eurprd09.prod.outlook.com (2603:10a6:800:120::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Tue, 15 Dec 2020 11:19:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 415221d2-0a36-45aa-29af-08d8a0eb4a2e
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2737:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0402MB2737A132BA58255016006911CEC60@AM5PR0402MB2737.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PysDr27DBnpvM126qYNHNHzg4+j2QZaG/Ie+PHxIiphuGuBSHTtVRhK+JBWrdCKw1m4/AqCKdpMXaOiqXySTbIRRJoFbeoqstqmhkkuUVSnUmPAOo+UkdpMlM2FmbVyu9VEKHpI03DU4x8pc5NPABPecMWPaa8E7Ar6Wjoq5EcaSk541D0KVLZgUCNZyCHWehw9w3aiDC9xyQHy4/dKXT3egJwXa1y0xpB2GVtIM2CfJ627v6jSinZ8jvYibYsFQQ3OX1xgRUYG56+3m0v8SlBqJMm8hjmp2aEOH8fXcvrsIwcvZdiFvjgu9xbUJBJvncZmzCM9AfPBjkh2U8hCisw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(2616005)(16526019)(8936002)(52116002)(2906002)(1076003)(956004)(66946007)(6486002)(66556008)(66476007)(498600001)(6512007)(86362001)(8676002)(7416002)(4744005)(6506007)(186003)(4326008)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?I2prbHP5Ye2N5EFUHOXizoGuNXj8vmo8xUFTMpdyOM/tpUxx//I3gJ9e+6vH?=
 =?us-ascii?Q?jjBAc1562tzMPdzKUiea2RaRhrKR68Xh1k2wJEx1vPuk9qIkhgvt2pLVs8G3?=
 =?us-ascii?Q?bObl1jBs0MZT9v5K6EfKyz8bT35zYuNAyFzSJJ7pbhgw3qUfYkKXVX4fE29u?=
 =?us-ascii?Q?Xs0gxZRthJ2ZnBi56b4auUp18IMAtB/Ym5bSksZtlaXO4jNUsBPM0LvSDq1m?=
 =?us-ascii?Q?7mBc08sO/I7B0NmwVKXA6ghIfX6ugA1ZwF06KxaYtO1HjLKZQqHYSUIKkxDO?=
 =?us-ascii?Q?nIjDz8SDpVfTFre1eyTUxtVSG8u4yd36HrI0AUZWnYjTKXJAet+dlo+oFYO9?=
 =?us-ascii?Q?xtTV/XrSHZsIqozE7FzRrV91AGgDY46rQLwmYo9y/palezgSYKMel1Bq0Pmh?=
 =?us-ascii?Q?54uxFtMZ4BUXHXovZdJIDnrv252WWR6j6ic2zL7MufIqmJ2sDzWd37i5/rU7?=
 =?us-ascii?Q?GzotEa/VsmQ3b8Lk+GldNtrLoCqI8SG5WjfotaNoVir7rx6NrxdX3LRRMyW1?=
 =?us-ascii?Q?1e85AyqtHH6mt7C5fWZlBRvfi/SfnuAaWRMkD2Jsl+IMWFtZGaRLEb7XYt3t?=
 =?us-ascii?Q?gUROlZR8CHfJoz85NUkaeNl6Kmcu6L6WRs8qwB1P3Nyjwn0nwTRfvxvoPyqE?=
 =?us-ascii?Q?AoHDc4Q9WtcXAJ1+BHWx0Tsk2MbfvRziMJPZcbDvVW+ujaKcHPStq5bWyOzC?=
 =?us-ascii?Q?VBBYAVyerh04co5+jUFxS0WvfaUo/PZIMvokZRSv8+M/iDdctb0Mm5Jdjx6/?=
 =?us-ascii?Q?GsAwVt3KN7TrZzea/qQikJD3qD+BDfugTVnwkaI1SpEZOxdehq99D9ZBoxA+?=
 =?us-ascii?Q?yrCrb6qWJIw2GLnZ/OdrQS33zPeUpDBwhUsdm8dTXEp0FNQLNrcfLS0jp+68?=
 =?us-ascii?Q?/lCKYBKkX/xJn8yv2+s0H/4d7hYTZ2HLOK2jAUhFR1BozYh+cLauaMsYWodn?=
 =?us-ascii?Q?/Rw21LPlBXjtR6+9iAfCC1OyhMYc0XwoG9ybLCrIBJZaGjyqvBLoK2TxTnEK?=
 =?us-ascii?Q?DtFe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 11:19:29.3514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 415221d2-0a36-45aa-29af-08d8a0eb4a2e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1Yx3wBjNT473vnCFFcmdouZSFb6+3viSSXVtCpfd9N7MgI9c/C4NC49vrp9C0ch4uO/cNN9qjnEetTB6A+Q7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2737
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

The driver is located in drivers/media/platform/imx-jpeg,
and it applies to the JPEG decoder from i.MX QXP and QM.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c9e221929961..09050a727d57 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12818,6 +12818,14 @@ L:	linux-nfc@lists.01.org (moderated for non-subscribers)
 S:	Supported
 F:	drivers/nfc/nxp-nci
 
+NXP i.MX 8QXP/8QM JPEG V4L2 DRIVER
+M:	Mirela Rabulea <mirela.rabulea@nxp.com>
+R:	NXP Linux Team <linux-imx@nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/imx8-jpeg.yaml
+F:	drivers/media/platform/imx-jpeg
+
 OBJAGG
 M:	Jiri Pirko <jiri@nvidia.com>
 L:	netdev@vger.kernel.org
-- 
2.17.1

