Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF8742DABE5
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 12:24:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728831AbgLOLVY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 06:21:24 -0500
Received: from mail-eopbgr130072.outbound.protection.outlook.com ([40.107.13.72]:15078
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728815AbgLOLVS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 06:21:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCr/GW7OPBCAKgZ4GaPBzHHMCSMn7v9u6XY922vt9DYXLmFQH5IOXR9n7ebbVVzZpfByhOm/a2XLRTXaWgwY7C4o30hTxfQUMvzEmbsHj1EnjMDEwb3LhpmAuBT6D4QPB4bUm6JQ90B5WJx9ln4jhq1K0grW9Kbb9HcWozJ/Cxj0WfuGrk9CXQeGN4ZrFHFq/sNUdh7QBFXp2fBQJEpaRNewdmFXyhpHBg+38BE8nW6ydYnDfOQsqTWnKo33jKlABwxqEFjQz0xx5fn3MWVu/8zZqxtFGetogxmqHd9kSUafwwEHIbYzJaZ1nYNPPuhETEmubvEwohjuswrEeH9cqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Df6t1acQ3NMCJjqvcfk/T2nwNJBI4GlqWVOuGVZ8cqU=;
 b=ZPg+hr0uCGY7SAragHU3VfZzLEVlV6HN9cslEIysFHauMn/crXBzD7H3GZB6RWCzO+sv+4bdm9rV6IljPOlgf4cEDpE7bPJdfv7n2X1xHppQkyoyNk6Y7GKMSD+79gSf8IN+Ws/RDoBVixik2OqNOW7C7BS3S2slyPBL1Mj3rRP9ej5Vseu0PTRY824BgdOyH1GZ2KV92pcF843Ui0EnzkzJ9fBzwoObM7kAf/L2SBHy1wFrbFOsL6anPEopFga8OOMgE56nZutLFCevOMtcc+l/3cJ8O9kzxJnoBFsmPguZRUazu+LrttoiKDiT8tUk7CkpsxLy7gGRrUfw7p+wLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Df6t1acQ3NMCJjqvcfk/T2nwNJBI4GlqWVOuGVZ8cqU=;
 b=RwN9aSM3BDwlH1ulC3AYNuAQ7NaLy4xYvyb/yOA65FqK2LqQkU7lUjxOPlTMaWE6M817kF9BZQCEi/xh5bK3WSJb/lY9DfSN77fS1kQn0IKw5zPi2z33GV+U3KwOsfifoYd7hI1UULcxIKAOjX0NBdpuCE8dm2SD4UG9Q2m5oQQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM5PR0402MB2737.eurprd04.prod.outlook.com (2603:10a6:203:95::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Tue, 15 Dec
 2020 11:19:39 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3654.024; Tue, 15 Dec 2020
 11:19:39 +0000
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
Subject: [PATCH v6 7/9] media: Quit parsing stream if doesn't start with SOI
Date:   Tue, 15 Dec 2020 13:18:41 +0200
Message-Id: <20201215111843.30269-8-mirela.rabulea@oss.nxp.com>
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
Received: from fsr-ub1664-134.ea.freescale.net (79.115.51.151) by VI1PR09CA0178.eurprd09.prod.outlook.com (2603:10a6:800:120::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Tue, 15 Dec 2020 11:19:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7fce2eb5-19f9-4f5c-2c1a-08d8a0eb4fed
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2737:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0402MB2737044AD6EC9EA679CBE763CEC60@AM5PR0402MB2737.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wP9aoV2pCVdkGI6XSjln3yxcD4eCBY96n0jWqbgWIwxtwdE/mQxCFbSdqhYYcxUKOGpiAVm06mgAp1X4twC1u4Hk/58x4yqwkN0HOBH7Up7K7OjLyDgirK/0qxNm4aFn8KGXELJrmUYmEn08tyvmLkPmGoEu3MjzfcQ7ePVZHGTljq0tLu1eLOM82F7oFPTu/C6CFYEH/Rf9/Y9mpDrkRMjKsMS9wVMSt40o5FeN7ZLIGAikUACMhoVSdVGAPiCGGRXj3Jl7fyJ6NOX3HP7ZK1j/MGxZn0FHoXyuXJbVc5eHCkekll64/lxWc3Ed8GJ04GdOgAf4l8LDC313h1oQtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(2616005)(16526019)(8936002)(52116002)(2906002)(1076003)(956004)(66946007)(6486002)(66556008)(66476007)(498600001)(6512007)(86362001)(8676002)(7416002)(83380400001)(6506007)(186003)(4326008)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2Ut9xPM5ZB/s/eWZGUPK147syBEV/JpJmGw8s2ZdvB+mDgxxi9jvKPZ7ltT9?=
 =?us-ascii?Q?gdLIGs7oh/eJRA3KHMepqeg3QlrQCuRM0jVOnMUTDYW1sBOVFg17knoiA7me?=
 =?us-ascii?Q?7iJk6fr1eMPUIx2aGaTp66O/QIOdlxdpTyNxqHe4zZjmNsX7OI1e/P0ibiAA?=
 =?us-ascii?Q?RH7cApYgVtrl3d5tBxh8Lxdg+06G8DUHVzaDuHqbzOpJ9nzG8+y7Q0ZotzoP?=
 =?us-ascii?Q?wmnhvLPGDaPKM0A73m/KPKpmr4zVIYx20JRZP87FCQBuu60ZK63Upzh6Uthg?=
 =?us-ascii?Q?kcvTgSS7zLwcouwfYptvNBRefxwpMZf8mnqIZIOY1ae57YfbPQtO/7OMwl9I?=
 =?us-ascii?Q?7oEZEwC2mzbuISMMjH+U22DleXxUZAskxwIZWG6PE6eSrE3vx7dfHAomF/XI?=
 =?us-ascii?Q?DZaxkMeNWCGWqM4rRa0Xr0tfDMkknk+1OaccQftLVQ1CyOSDQTENQQyUayEI?=
 =?us-ascii?Q?vGAIJwoghA2C4ARYpw69fihU/rXfFEf2WD6StubCRr91CGlbCjBdCOQX4708?=
 =?us-ascii?Q?UweylIJMGGepzPbgwhhCKlr5gd04ffBRck00gJjri0Hmgnh6igpxGJjQn1P/?=
 =?us-ascii?Q?AkQTNfvZv40hvvW6zJG9DfPgbdVmhXH+E1SzC6mrfDTg0U2qmymEdqqWfGOj?=
 =?us-ascii?Q?CSzom3IZkBkRrIOQhIDyqeufIuoMJRMQkT6ELVBUKof0Of9Z12NYq0KD/elC?=
 =?us-ascii?Q?D83nlPQChRCBZ57KrKTc6l+uHLKXk9cyhOMbt3V0dNTJ0rrjb3FgWKDcKgsk?=
 =?us-ascii?Q?fjYoib/NkBNsPTMHxBmNNzAwD9FFF0y97j6Q5duf22fXi4Nt6uu1Py5G3drl?=
 =?us-ascii?Q?VjivIjUxim5Fb+GoPVG5mG9z914vtXgIyvP0xO0n/ff0cu6sIxy/kGSguRjT?=
 =?us-ascii?Q?AYzF1syXPG8t8sgjjhsfFEvO79idHJ5NgwI2BI/auYfwfuQrgQgAhg6CXtpp?=
 =?us-ascii?Q?O0SS57zW/DTIkVh+TaP9xE0YuSU53fc5H30kmFe9gyBcR/SKxJOn1sdqE5dq?=
 =?us-ascii?Q?Xgfm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 11:19:39.0238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fce2eb5-19f9-4f5c-2c1a-08d8a0eb4fed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IO7Wp+wl2KI35rjjxT98WuP3a6gmHhRAUfUZ5QpvXc2IIkLf/b8MIppswR5TRlem2viLIoND6/nlHPPnZNCe7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2737
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

In the case we get an invalid stream, such as from v4l2-compliance
streaming test, jpeg_next_marker will end up parsing the entire
stream. The standard describes the high level syntax of a jpeg
as starting with SOI, ending with EOI, so return error if the very
first 2 bytes are not SOI.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes in v6:
  Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

 drivers/media/v4l2-core/v4l2-jpeg.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
index d1483e7a775c..dc9def4c2648 100644
--- a/drivers/media/v4l2-core/v4l2-jpeg.c
+++ b/drivers/media/v4l2-core/v4l2-jpeg.c
@@ -503,11 +503,8 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
 	out->num_dht = 0;
 	out->num_dqt = 0;
 
-	/* the first marker must be SOI */
-	marker = jpeg_next_marker(&stream);
-	if (marker < 0)
-		return marker;
-	if (marker != SOI)
+	/* the first bytes must be SOI, B.2.1 High-level syntax */
+	if (jpeg_get_word_be(&stream) != SOI)
 		return -EINVAL;
 
 	/* init value to signal if this marker is not present */
-- 
2.17.1

