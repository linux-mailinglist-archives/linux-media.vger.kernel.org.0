Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB0BE2A234F
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 04:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgKBDKd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Nov 2020 22:10:33 -0500
Received: from mail-am6eur05on2083.outbound.protection.outlook.com ([40.107.22.83]:60192
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727883AbgKBDKa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Nov 2020 22:10:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGi8v8zZiKAYexd0SkyaVsokTL82bJrHevzqTuS0tGIWWZb9tP8H9kukPF2d9xqXAc/VQzMljyMawUdNO+K5vlOk1FYgEtlUptemg8M3fmHSZF3upQpSV9suBQxTPi2UTPtSd4Syl6eOLw0sQ1ezCSfITN7eMHOioq8jgsCjlPi4Oi4pc+Ya/0uq9+mgh8UjDBxJFTKjogkz20fwnHO/Xh7Z/fxI9ZGyObj/vg1yAhCO8MKw0qoAS2g0er8tdh/9HObcpeLkGfmJaHJ+GYYsB44qSe+Ockl4uewJToRJXKF3vQDLrsFpVd+LdweDlLq3ozLGSb6Nd/9GO1Ik2yZYaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKEMAYBoI/e2uwVluhjOnAF1xshVzRKA129+ErIM+aY=;
 b=Xcm30ObZwd47GY9a6+P+xJwPb0OD2B2en0i4i6Ek7WmtDUE/ZwOh1MY2LDmgnbnlZ074DJaCxOoL7HCyydxukZHgrffnMSUsuqa0nZrANPomO6upSaMJZKv+LwNqTLs0e+Hin+3mwS5OtP/PmJJr0sD6EUPMIGVVVZYgX8ulF5isqgUYI/++yhbq0cJ5mM8xI3T1SpNs9DaQccOV18ikolL2j/SAVZH2ygkoxN6zizn4+hhAjs15DH/WQo6oVzqFJML7NtojoEsYElo7nQTXdeXBptSt14N9aDI8C9Di2U6cr8q2qE/2WdeCWkAiSDSo9a8hD54KrAS33mZvGdA2/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKEMAYBoI/e2uwVluhjOnAF1xshVzRKA129+ErIM+aY=;
 b=KDk8nnJdF7J6es68dm8Yu6Jd9tHWa/IkJ0xI+P3EokoIj8QBnoY1uM6v/yVupV64wegPYMwY7rYJtcNHk1kui/wauRuULkUNQmtRhaHpwLroO56IXfFwmDlKRH3QDq1ACbp2rRSvenfw+l0IQy3v4ChwNmh1Q83wPPYoGpwO/Zo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB5173.eurprd04.prod.outlook.com (2603:10a6:20b:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 03:10:09 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3499.029; Mon, 2 Nov 2020
 03:10:09 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, p.zabel@pengutronix.de,
        ezequiel@collabora.com, laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH v4 09/11] media: Quit parsing stream if doesn't start with SOI
Date:   Mon,  2 Nov 2020 05:08:19 +0200
Message-Id: <20201102030821.3049-10-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201102030821.3049-1-mirela.rabulea@oss.nxp.com>
References: <20201102030821.3049-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [86.124.170.94]
X-ClientProxiedBy: AM0PR06CA0128.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::33) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.170.94) by AM0PR06CA0128.eurprd06.prod.outlook.com (2603:10a6:208:ab::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Mon, 2 Nov 2020 03:10:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b8a7d44d-3589-449f-f9c6-08d87edcce6e
X-MS-TrafficTypeDiagnostic: AM6PR04MB5173:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB51735A0DC45CE1EE2492499FCE100@AM6PR04MB5173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XOVY8vnSsvw32IhQDpHJv2Gji7TQH1UdupLyPnx/vuAMDNhETYtMpU5pL8QmPlrzLhW8NqOBrjqkD+QSA6NW84eMwaagArdqohe+emPtKJJiDymOBVKzCX/qRmpR/Ux4GQjk858keoiDAbMrf19w03+UELSpopMHB3u086XMa6nG13w5vSWpwScOfkpHiW5TITRmI8n2sSdBx6BFJEt+24a/beI6NX3qKkdPxcpFny1+FWxeXF6JjmB9XS/QscrJ/jKqARONe0+WjDQBFAQsKUBpvRaCWjU/qJzHLj9RAWLAoQ9nA0uoaCjkdTbsMk4/5fGnQtnA33Hvjxlo3vN5Rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(5660300002)(478600001)(86362001)(16526019)(186003)(8936002)(83380400001)(6512007)(6666004)(26005)(2906002)(6486002)(316002)(4326008)(66946007)(8676002)(52116002)(956004)(6506007)(1076003)(66476007)(2616005)(7416002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: ko5nrKEAGozwfIk9CVQZhjrij3ePTotHtY58BnQxiJTXUvcVXX1qU+qMhbX3KdP2sFtDOlxaoz9RiuMMmbgqwb2Qn1C4Dlk18NPLZ+B5oE2Qw2PFlJbF530cGVzO4+wCd+t4OmzQ8Ih2rt8TAtwrLii6UVkt3u8F4C1s1LuYHet/UFVwXvQ6gyp5I55C0cd6oy+PGdlNMP2Cl3CYVc9S/t2iLnCeLFy9wu31ZZnL6wDAkD4zvN0TVI3nWfGZP0BJnuvpO8fF6ccRlpOzFaOrBUKXdJb4QNab5qsVHqb/0pTJlxa7hi6453APjGZ9WaA0RbctfvJE9W9CqoJUZxmDIRQ55mc5n+3Xgj7pFYajZJuduBm6/WkZ4aYLn9hkf0XZ7mLp6NoRojWvX4vhYyBqLxfkEc1a6ActEeChn9oI9JXyCpc/t3sd9jbkKIZvjikChXtB9+f6jt3xw1w/tRdwRW8uBskwbLgGlo/aR2MIKRKKrZZmDB87gHL85btnVZ25os0m0aibuXHMUJMlzYcQiEJ+0Da3utxKPtLG0dx7ikjX+k8ZTJDqcsBEfXwgiomM6npD8LtXU+Qym8iWQFTEFYzyV45bM0Gsoxw4oeKg0wQk8RHgmrAA4Zebq4nVgipEVwTXLmULcZR592ubrI1AgQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a7d44d-3589-449f-f9c6-08d87edcce6e
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 03:10:09.5978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3lxP5CRDWtBCX2Ya1g8durDtGZvC1gZKNTdvKeyFIu6Wfr34j04LTzVUgZ7E6U1ngwJbY4l2UyuTDw/YCfgmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5173
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
---
 drivers/media/v4l2-core/v4l2-jpeg.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
index a8198f98c158..244feccc4ea0 100644
--- a/drivers/media/v4l2-core/v4l2-jpeg.c
+++ b/drivers/media/v4l2-core/v4l2-jpeg.c
@@ -497,11 +497,8 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
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

