Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3120E2F1F77
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 20:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391142AbhAKTbh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 14:31:37 -0500
Received: from mail-vi1eur05on2062.outbound.protection.outlook.com ([40.107.21.62]:30817
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2403949AbhAKTbc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 14:31:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3JoJVZ4QSTjIHX9GWwDwH7G1bVgU9hZpg4+PQYPDUFWENyXmmtvS+rrSfFpkVFq9qGC9jAThXNj+XdfWPjh1fBVuwfXnZt8NKltzkV/5GUUyIGvBhMk5+tnBqU8KN3ZmR6amXS+xu70Eufb22Vn7HkMQHonIz2mrHjiq3CxFRzl5BPbLv3hQmafMhAhvR/dYIK6PV/bud0F/A4KP1KUoR5xnozI8StLPT++7tqXP1Dr5RZsWxVS8d60nc2/p8vSn9n/AKHdOBQij2jmgwedk2YUWgXdy+YfUs9JFiHSZXUmKASUxH2iFvzOT5U/IkR/3BitGGkxzYtn/NUOu6X94Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wh+eMM5V2EDlIRxTLx1VkWm1D1hAs25FiWxPzQfcS5Q=;
 b=Ll22NbFohBCBod8waWHhk+3u6+BGggRuIoj+O5hUDRC0taV08A05WYVbXJMciQmZdXJiTdqS2ze1d1CYPsAD/nZjKPljSlZ/oVF+xTRZf8l2+BK55Q6k1g8HTIEyr4hFyJEFAq1oysVdr4rP90IxR9k+SCcn2kFob0bq65SctDiPN3gw+dhS9SfUMUFdTPAkgmuoBjWG0I0qlpuFCwpsPo0x9WvFs4c+gwd6DMpYZ6CnrukgiRDhGCSWd+e4Fjr4bJ2+Yw6ak7YlUrvJdUGrQA8hzvkblqZ0FtimS5po4cwsj6Sg8cT80fvNZ9ZATxWrCockij9EnCeT6y8VS8qIBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wh+eMM5V2EDlIRxTLx1VkWm1D1hAs25FiWxPzQfcS5Q=;
 b=P+Bm6qUoV6TK4LooGM0qDhkfbxZIkL9SSWjCIii/BWlLq0oF9drn3Y98rYuEFg4fhHryz/yQ4iJ00K7neVuzB6XZJo5WSvDyLJwcLrtqP1aiQLxi3qwupaVmZqa23gXLpprqXoxRY7Zm7YoZrIg8bpZBogKXXWK8AMejqXQgiDo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB4424.eurprd04.prod.outlook.com (2603:10a6:20b:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Mon, 11 Jan
 2021 19:29:01 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%6]) with mapi id 15.20.3742.011; Mon, 11 Jan 2021
 19:29:01 +0000
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
Subject: [PATCH v7 7/9] media: Quit parsing stream if doesn't start with SOI
Date:   Mon, 11 Jan 2021 21:28:20 +0200
Message-Id: <20210111192822.12178-8-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210111192822.12178-1-mirela.rabulea@oss.nxp.com>
References: <20210111192822.12178-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [178.138.194.64]
X-ClientProxiedBy: VI1PR07CA0296.eurprd07.prod.outlook.com
 (2603:10a6:800:130::24) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (178.138.194.64) by VI1PR07CA0296.eurprd07.prod.outlook.com (2603:10a6:800:130::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Mon, 11 Jan 2021 19:28:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a08248c5-40ca-459d-848d-08d8b667264e
X-MS-TrafficTypeDiagnostic: AM6PR04MB4424:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB44246CD66B5A945DB079227ACEAB0@AM6PR04MB4424.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O9usCtttSzmYRUjLWOAg2TTI6SxaLofnbfA/g59FF2IU2y9vP7QZB55RMx8JbQwU5FQrIS5toBrma8VMa/zyks5AW+cDR0SUkJFVnbrJPOfFFGXoQV94MBxTdv1Jhi+cxZhwk/5gPKh2Pu4eFmpN434PFdj5SJoCdwNXdj9r7OkLZKUcvc2SryBtIhtsu8M56weIUEsIZMvYe6Dme12w8ecqlWQ8LIEuVMI6wWkkZbvhJm68n2Aj6yJQZqtgHTrXQgRnoHn39ty9v1LNDa0pqDSvcuKY/ER9qdQLqKhEj66aa5RYWVx309iqvNoqbzxbN3zoSoNwFx5Kb31fcJxzT/Bi0M19IB70lNuUeFZf3UccXExMuIsdsq4TLkI5P++A0KqOkopOWCZJYPI0PmYD7HiMQxwBHOa2rxP+WVxS+EG5k8G/dle2AqQk0ZSOy8+8JM3jvrB2qy3e+nHWqwwYLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(346002)(136003)(396003)(6486002)(6666004)(7416002)(5660300002)(52116002)(66946007)(316002)(69590400011)(478600001)(4326008)(66476007)(66556008)(1076003)(8936002)(2906002)(6512007)(2616005)(956004)(44832011)(8676002)(26005)(16526019)(186003)(6506007)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/49jXW8DnjMhDETEaHkE8bqb6kJ7blK1Ue4aRl/ghoU23FazhCQwzBC4++eO?=
 =?us-ascii?Q?5gY3UgT/YIXMACDS6RMJ4fw3TRdY41++LodxpfJPTA1eubvhZrMVoQKpK+FK?=
 =?us-ascii?Q?f9XJCi6jaYI88P+DJNo0gZcHV6RP6r7OZVoVAcR+sesYZWbPYBqczrE1e875?=
 =?us-ascii?Q?6dM+8htMZE1FpDoUHWBCr75vWtKqkb1ApUMMuMND8fun2JehrJ5a0ofIpJNb?=
 =?us-ascii?Q?rsTgylzV0h5bQHBbsjKVez8YwEs6a/eX2iUaRuEdnuvneNFtcLHMVGNfTAt8?=
 =?us-ascii?Q?ZOJKhDOQsFF8AmFHzHT+6AxUUr+sY4lNqwXwcytb5NrB1nH6xdk6Z61U+Eiy?=
 =?us-ascii?Q?E16VbEAwz1w978EQo0GwY2mhQAg+3gE0G8Gy/7Rx/tVkTx8WuccRaasBj58h?=
 =?us-ascii?Q?JCBBjDXPlEwWJdA7BJ2lvaYIFfDY1XufW1A6huOyIo5tqyp1ckRiQBBiyyuO?=
 =?us-ascii?Q?tH4sny1Q/HAvpjoHtReFJSeY0Rig2jXFgyCsCMUAqg1/F6fXk/X8zfXTrssx?=
 =?us-ascii?Q?0BbVHMQDccTwly9tqL082qgN67BSZaaD7kZh7QqazGdlonT3+RlUT2m6rMTb?=
 =?us-ascii?Q?KJqkSw5KtGRdrNGwHBe9D3WxReSVciBROmS94gb3N9DZwEYSlposratGAdFZ?=
 =?us-ascii?Q?iPhoUjkIIXr7HFq7Um2oj8ueF1h9TTMxVnpYt/2PxHJn4LnPzcRYZVZuVrwy?=
 =?us-ascii?Q?dIvNeEbhc9vv8UR1aKnUVRx5MCIR8NWgK9lSGnDU4ttzxmygBomRv0z2i7+V?=
 =?us-ascii?Q?gOpEpKS8QORSduPirR7qyVb4jUVi2XdFLCcps8ua/GyhF1br/HAWyD2Ik5Mc?=
 =?us-ascii?Q?V7bJSVnuT4Xe7hySXKqVYxiht2TjaWJxOa9b+h4W7x3gylSH6yEQugqB28aJ?=
 =?us-ascii?Q?vB7OS+XgkhuuHrOYJfl79aIe1MFxpPTr9d1tW9xA4rU4ev7ZajC0ZN3lkTbf?=
 =?us-ascii?Q?l7/L2FJkS3+mi9zyq2/V6aC7a1c2gTIV1J4+E5zHj4cXDywgG2uJehZM2ig4?=
 =?us-ascii?Q?GIak?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 19:29:01.2573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: a08248c5-40ca-459d-848d-08d8b667264e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rqVhqStN2vV+sVjYIXxrUUoI/N5HvQ/zKBgzCCM1Z4KENakFtYNJKPxvDrZ8Syso6ucKNfOIo6R5S5fFEtGrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4424
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
index 8d5fedb136dd..42aaabc71b7a 100644
--- a/drivers/media/v4l2-core/v4l2-jpeg.c
+++ b/drivers/media/v4l2-core/v4l2-jpeg.c
@@ -506,11 +506,8 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
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

