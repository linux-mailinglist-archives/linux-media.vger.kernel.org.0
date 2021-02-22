Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05A4D321FC9
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 20:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbhBVTNx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 14:13:53 -0500
Received: from mail-am6eur05on2046.outbound.protection.outlook.com ([40.107.22.46]:61312
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232822AbhBVTLe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 14:11:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HIf0QdKQisjqvoc+5qIBdLRcDsZKNXf3OdE30SO/wqT81unKag4WBH3wjSOlVYeNLHeaGPjsj2Dm2J7ja1RFL6+4npu7BKsRd1PypgHA6bVDukpujhyqhvvgcdLUKVzXcDBFihH374Zm3XOiZ/yoajqUIRvxvJaE1Xe8lKVTV6JcRwVpLQaHoUoxLNQN2qb6lMgz1WOTmbMzZ2ooUykM9Fdx8b8h7spZE80sS8EVnI/6igLo/5VDb22J1JcO5aV8uHxP0CXGSKPT9bQ/MjIifRYWv+JPGyMB3W1r1ZKk/Oj2KZ2+i6uN54x1V1FGvS7rHGfW4WpAPPvS/mx1lw2WrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eQQ9KI5URQ8F+zUV1p12BhOStucOOJaEY88vao97+Q=;
 b=Ini98WCpO5oE89qWqwyvmefGetplYMbd+ubu/6exWS6dsSJknz9DJ7dIkABJyxb4pnJyX9VNQwPTTlMbwDeGLbiMXL8nXFD7C7+uudX+6rzOAxjPmGL8i0ZvvMMAWUiy4+kEY/01Nk2mFzxPt9L5Wf1EmW5nAHLUzHLOzJUr/3KW/+GrJDKDK0lCWWJ/H/U5VRStNItnl/7kcS4d6Xny7j0cJELE1c2NxCgO4p/2J6/74DLrp5NJFP9J8HD7uK3iaaVIYM4jNKyeIqOS9PCRbxnSXGlOMFEFXMFVdNxiCSLGO43An9/D/JsroplgQ73famPZzd0ItLSdNcJYXHaG5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eQQ9KI5URQ8F+zUV1p12BhOStucOOJaEY88vao97+Q=;
 b=f+GhgdtU+kbQsLXljvWguVPEIze8Mzl4yw3JaK8MsU0j1yVq+qmo3YL3tfl09aANwjm2FhEb1Oy9gVsHq2qSj14wUGwjLpG271XC/wXei9GFdyz+mV+PtzreKJsfqrGxK6yv/w9/N/nJ54DNHSGcLbPvNTd42Y0lod4Sk7HHCKg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AS8PR04MB7591.eurprd04.prod.outlook.com (2603:10a6:20b:297::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Mon, 22 Feb
 2021 19:08:17 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%7]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 19:08:17 +0000
From:   Mirela Rabulea <mirela.rabulea@oss.nxp.com>
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
        dafna.hirschfeld@collabora.com
Subject: [PATCH v8 7/9] media: Quit parsing stream if doesn't start with SOI
Date:   Mon, 22 Feb 2021 21:07:36 +0200
Message-Id: <20210222190738.2346378-8-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222190738.2346378-1-mirela.rabulea@oss.nxp.com>
References: <20210222190738.2346378-1-mirela.rabulea@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::13) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (86.124.171.30) by FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.8 via Frontend Transport; Mon, 22 Feb 2021 19:08:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f59dbe10-059f-4225-993c-08d8d765365d
X-MS-TrafficTypeDiagnostic: AS8PR04MB7591:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB7591BC14C94FBCEEC6395758CE819@AS8PR04MB7591.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cQ4Dl2Fy7DJrN0wb9jwgedbcAhY9kgzznfCFOC6i/uYMZk3J+TMgueQQTzR5d2eS3QjfIBpa8LLAtSfuU+RPc0via/ptaV4DsnaWfQ5oHXYWAngIt106eOj0wCH4c7mxZHIlpBp8AZqGQkHXoz7d6u45Fe0xZWPqwdVw45lR0Fb3bLgqbwVUot8suHUJJTthNH9009n5plbZQXMgsKS0LrD8FQaFdZdDRBJBdSmP3AS1HJFSMKCROzRF6tl3KxTFVMQJNrcZv1dceRJ2hzqLgpu53Rhc3lGAtsL3YtZBdKfHk0kY8GQ/2Atlu2q3MUfSlF3LeQMuTGIzez+SYTshBpJ3uO7mPMCYZM/Xbj4ljjw2IknKJ44RckrTnwQjmHVe3EcEHr6c1UP6CW5wyVIBr486wlb1apMIG5SFTDWzyWQhSmn3V1u2FaoeNkcJOS45r0ziLucmKtaCktUSORh0Fq+fSEdE+PdhxSfDUm0dqJybCUpYUZV8IFCgKtJLcFzPBzX12k5ev3L8On9ssqk4sfBi4FQu8u5IJ9FK1GuOTIU7LPZGw1xVXcBCjtoSKeltWLjQ7tcL6L4soa4XAu0xoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39850400004)(376002)(316002)(6666004)(2906002)(83380400001)(956004)(2616005)(52116002)(8936002)(186003)(69590400012)(1076003)(66476007)(6506007)(86362001)(44832011)(66946007)(5660300002)(478600001)(66556008)(6512007)(6486002)(7416002)(4326008)(16526019)(8676002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZO5L3YeMPk8GPpGch+1ljO+LRGnN7mF4UZfvKEgWYi6hhUgiWQzCdUrb9NRu?=
 =?us-ascii?Q?i8+0NPziRF1fyaFq4OSgnxZQ/sutNQMDGoSYmLYaf4AkspnbYR+uJ5CjR9Gr?=
 =?us-ascii?Q?HVJgK0URCOreyeYlRFkeEZG1i6ULksJ9Rz8I0xNRL0wZaTJsQLTizwxr0id+?=
 =?us-ascii?Q?R8PtOSyZfYJIKvIKDRP8GEofsD7Qa9hHvsYiAi6Xksn3l15ywUl9mifj995t?=
 =?us-ascii?Q?pElmaoRHaXNKBVwpMxFPar+ftafqZ3L5lXn3M9A7bxvCIbxHbCUjsq6olvRY?=
 =?us-ascii?Q?8NCRyZlkqQf1uF4qx2UvEq7jAqizh5kjWPRgeFYU3TIy56ZIYHs4o8b0uWco?=
 =?us-ascii?Q?GdnIu+gU6eUW/MVrmhAq0oRI2+W7yzWAcpXJzElcP1jkQ37RAgnxipncqab7?=
 =?us-ascii?Q?Cq+zi2tZ0aQXRlOr6wLOcttNrKVOZIf47ZEKKULU7xvcmL3Et7P0bX0bIcPN?=
 =?us-ascii?Q?2HpjuypCJdxxGu9kUAo4ufxUjctdTXw1R0MA65gFJHqknb66HOeB4RTp07Lq?=
 =?us-ascii?Q?JSmcHP5e3wkgbX8t2JFeL+fhz4R25XNxt3DYQPkp2x4Mgd3hDYYZoM+tyXna?=
 =?us-ascii?Q?598o+acsC6Aylm9LRxn+SidDROGHbRmGX1GwXb3y2ASfRL/1ybQy8iiDgygA?=
 =?us-ascii?Q?lm/LUScdHqybzJPxC2P4zC0XqcQhAezQWQJ3hX9DBtmEnyGHE1o37ijUrob1?=
 =?us-ascii?Q?9PHRjLSm9U8aBQ6FE0w95Z+7zJ3srdNtwlO1KVsNetdWo5UMF/Sjx/bmGgWs?=
 =?us-ascii?Q?258EB5nL5kbLPMIqyD6K+c2LvfcbkotTkQBRiSAtbi4wpLhbLW+TuHPvwu1L?=
 =?us-ascii?Q?6jJPLCQZoAcPTlU47FLM9rgMQe7mrwvb6nZiRS0S5fs6PZ5toDn0BB5iU2uD?=
 =?us-ascii?Q?hEZ07FNFAO/fYcSJrymUkkZzmWou69g4T4Z9xWVZNWFCU33EJQ+C84NEKGeu?=
 =?us-ascii?Q?cJgOycI+7EkytUs75AthrGeqVjJo4/cAe+im5GG3I62okMP8suu9YIhV/nXh?=
 =?us-ascii?Q?SvvC0tDkyRt1VEQUroUKRz6oR57jSwD1hRpVw2wCJnVTPhX2h7QKT2Wxj0Kz?=
 =?us-ascii?Q?u94lxqRqFqmJVuZQR9Xa6sw1StOa3O3aDDFAPiuRSQ8xKFgc5xmCjapmitTY?=
 =?us-ascii?Q?rNhzkNdX6WrzP6DXkOIf0ROIpMSF83sn8cjXkYzHyjcah14yqc+bCer4gb8J?=
 =?us-ascii?Q?mKSiOxy3IZLmu1g0vv5VQIRZ1O3yqC8BE7ndJ3ZEyDdl2VMRWukegcd2JOso?=
 =?us-ascii?Q?bUDxcWl7ccMKzOZfctp7H2HhYEnFu6h3lcXBA0s2s5oUzht3pABICHDaWrH6?=
 =?us-ascii?Q?r049U9ZYCtdaKegJNxPafX0QQQu9oHkwsJabfY+sIrKEVw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f59dbe10-059f-4225-993c-08d8d765365d
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 19:08:17.8436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JOfSuzh/FhFpUhix0MXyZEWlvxRRckP4Q6xgyM408IEJbkylIm7Gr5WgOYQMgfV472y+UqOQ7rhc53A8joQiXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7591
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
 drivers/media/v4l2-core/v4l2-jpeg.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
index ede40f2a5456..c4c0d6dd4577 100644
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
2.25.1

