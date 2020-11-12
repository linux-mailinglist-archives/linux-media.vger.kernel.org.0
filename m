Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B461F2AFF59
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 06:46:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgKLFcQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 00:32:16 -0500
Received: from mail-eopbgr00046.outbound.protection.outlook.com ([40.107.0.46]:31189
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728076AbgKLDKr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 22:10:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JW5ayYW2RzHPi7I++ngjFauN8FEebfZRIdYgRBG9X8Au139V5Y7C6pCnUepSQEbPtAFQHgnmNmPLKAi05fZUCOrGc9xkk9g3/Vp/+4YGSgQN+0riumNc6oZpBnl/HFrXfpheIP6w2ifKvr9mBfPasCEXSRtHUHHkInRiX76BNNVHxK4QSQk6TT3Am3st85v6kPRGL/pFODI57GEiD6x4Av1cvBqDPS+EamZ/qizsx7/pToaYyBITb97YyV+7K2rGDwEx/y53KMTbQYMc20f4eFHbJjL7RH09L3aqYqxZvNRt2kk2slT2bdZLU3nmZEx2hgoih4b/oN0VGJXYimcTaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dGeUtH5KEQFsA6wylGwbxNg7IoxSf2rXu3u3FHZ62k=;
 b=gIFXv+y/2vbq3cE5OkBs5iDpEH5kAGppWdQBcJ+o7lw5Sb+iukT827ftFWZdScmsGyK3BxVtLuUNdgXG1W+eYa0DM7nTmaQZ/jN5WtzrdDPQ1xzak1eYgQEL6TAQUw4kWvJlCqHCaPEKg6uE1I75OMfTeW3zmcRXFk3Xy3t8Xdl9aLQ4/UqQzMKaBnWcaz82uwP1a7IuREnQGEZtwyXbTA2m3Yr2LW148z2rxd/21Mg0zbeKdvemKtQ5ksxGfxuy1NdeWmar3iOwES89x1pquU+/2vLCs7XFi21A2ryRwouKY2AsX/MVP+LwrfbUnaLGtf2m4FI/EgT2jmLs6LP18Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dGeUtH5KEQFsA6wylGwbxNg7IoxSf2rXu3u3FHZ62k=;
 b=QJFWfcV+/IIvzYiLK3cl9G7I5mbSHT+Z4RkKhMCYqcCot2UItCJaHVOvX4QG9ohC5gvVe5kvTI/+X7ysZOWZBgDrTDXFsbhVgvLqE4//incqdVVVbdWQLFMQUuCqNcdMgT8XZ3OgbfFVIeDk5gREsliLKKp0aGbrXobDfd+B4zg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 03:07:21 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 03:07:21 +0000
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
Subject: [PATCH v5 09/10] media: Avoid parsing quantization and huffman tables
Date:   Thu, 12 Nov 2020 05:05:56 +0200
Message-Id: <20201112030557.8540-10-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
References: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [86.124.171.138]
X-ClientProxiedBy: AM0PR06CA0100.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::41) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.138) by AM0PR06CA0100.eurprd06.prod.outlook.com (2603:10a6:208:fa::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 03:07:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 30ab7530-b30c-46b3-cf04-08d886b811e9
X-MS-TrafficTypeDiagnostic: AM7PR04MB6997:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB69978A4A5FA660367665C512CEE70@AM7PR04MB6997.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fmv2jsmdERE9gI4gMuM3VVn2Q2kvLX+bVKOwatsMIW6W42GspZzLY/FJE5xSXRtQqF+OkRk4RuwQAuY9GxP9oSxfWEGLfnTEQFderc757raD5qfTnYU2oxkB0BdX8CI/ZlN0STgn4jahJuMyzcHntjwkKbHeG30CCQ6s4mdAeyX5G2ymZH1IcxhoqDFfzvHDllwDW0oCU/fceOuDDDFn1fb07NjfNTMSeB9YoDI2bR03GOztPM5R/9SFFOi6i0Vc2WJcyJXLZ3I0E3klA/IjgY6iliPEXr9Fx/3fOv9WyYne/mnaEhghnMXjpCaQ0glNXuGa0dL4QLEPuUGluSCa9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(6666004)(1076003)(316002)(26005)(478600001)(6506007)(4744005)(4326008)(6512007)(66946007)(66476007)(186003)(6486002)(2906002)(66556008)(5660300002)(16526019)(8676002)(52116002)(86362001)(7416002)(8936002)(2616005)(956004)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: n+62fehpmhj6npwL1DlP3DBF9XA7NYB0TUyXwifBfxQoJikl0GTPDTZok6RsdsBuNIS34c9HU+0St8+7n6RC7DZE2099rzoIDiJ+4NeKpAQ6u1wXNe1w3lL+335eMt8mmnK8z4QaFDYBxcu0lI9aG7I2dOy3F4zO4tQEoAfSB8IAqqwjDPF4YeabJ5Dbp8ZUqIWppqvpjKSE9r1w78a/aCI3eIiJPCq5tigqqEAKIxVf4GXnHZ5EzfTwk3jxLBYLSLnRUJf090ITvS/kI8M6v5teBF1LXFx5adMqBTYJ0QcG0izzQYY4fjaaertFNYbcNQL9XFnWVuJxriYGCP26uPUwfTPUeyYiDmBYlDlnNqqAQPhS2yB+QqjRLy/EYfhko0TjOhi8NgSPLUl/kOdCyZuIW+Yk0LJme2jApr/nwhuATy5j/wL2viKIKgFb9Nft10u9v5V92gq0oQ0gryuLfVQxhQcjgjw85PcN9GAWFYP6v0GWbMdQwWaRUCj6HlYPUkAv6B6yZbowRkxewaqLvgWjpEn5twtBPZXJ9egUEIt2/LMKXk6LzNBCS+3718YFROf7xnqpD0uk5Lo/J3FAsIpyMIg6g+kof2uohzHyxY5Oq564mzMY+OgJ1AW9RgiKNz3aiOOkh9c8UhiqD9pDqEa5L8cqMIXMU67ePstX2muZXZX910DmiiTupk61qQOMgkWDiY02sY5JOcz9DtJOGstgvPNO5U28TY/QwtRvYM849C3Xuw80Qzwqk6T0aQKY6FR0qKmui0QjTQmXQFuv5lMkKh+Z/9DD74X1RL34SOyudDzhusQEt9Tps+hA7LNj9Bfb+w0bdlzwZsvoDVXNjS/ZamN0RZqhig6OiZ3k7cpFPgwN/020Gr3VOk/k1MZOs3VJyFKREcjJMUIYcOG4tw==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ab7530-b30c-46b3-cf04-08d886b811e9
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 03:07:20.8213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4ESul/35/Zwbf0rL1Rhgfy6j48XsDsi/fAUCszV1pfcAZtk3J2JW8ahyEx1mXhnif/JjCNnO0qEzSxoLpg7hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

These are optional in struct v4l2_jpeg_header, so do not parse if
not requested, save some time.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 drivers/media/v4l2-core/v4l2-jpeg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
index d77e04083d57..7576cd0ce6b9 100644
--- a/drivers/media/v4l2-core/v4l2-jpeg.c
+++ b/drivers/media/v4l2-core/v4l2-jpeg.c
@@ -307,6 +307,9 @@ static int jpeg_parse_quantization_tables(struct jpeg_stream *stream,
 {
 	int len = jpeg_get_word_be(stream);
 
+	if (!tables)
+		return 0;
+
 	if (len < 0)
 		return len;
 	/* Lq = 2 + n * 65 (for baseline DCT), n >= 1 */
@@ -361,6 +364,9 @@ static int jpeg_parse_huffman_tables(struct jpeg_stream *stream,
 	int mt;
 	int len = jpeg_get_word_be(stream);
 
+	if (!tables)
+		return 0;
+
 	if (len < 0)
 		return len;
 	/* Table B.5 - Huffman table specification parameter sizes and values */
-- 
2.17.1

