Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF4736A0CF
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 13:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231387AbhDXLQO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 07:16:14 -0400
Received: from mail-vi1eur05on2042.outbound.protection.outlook.com ([40.107.21.42]:36512
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231203AbhDXLQM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 07:16:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7yV+BTrZc25RM9K6sQQPB+JxkDXFXDaftH4MifuxRg=;
 b=VaZtzrJsx7TtNaqT+yt4ZmU22EZWIv8+Nvpa03tTCoNagV2Lu2tKUbs4TF4dzUcQe1Zd7jK50YbmOHbHT6lhO3BEeNu7d6bpQt6Af9EbkUOaHowXx8fwEOeB+th/z+jk0K5Z4GGo+zaBE00xHVK+UcRNdBkXeaPLYeDnCMNC/6A=
Received: from AM6P191CA0080.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::21)
 by AM0PR04MB6001.eurprd04.prod.outlook.com (2603:10a6:208:11b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Sat, 24 Apr
 2021 11:15:30 +0000
Received: from HE1EUR01FT061.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::f9) by AM6P191CA0080.outlook.office365.com
 (2603:10a6:209:8a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Sat, 24 Apr 2021 11:15:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.81.10.179)
 smtp.mailfrom=topic.nl; leopardimaging.com; dkim=none (message not signed)
 header.d=none;leopardimaging.com; dmarc=bestguesspass action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.81.10.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.81.10.179; helo=westeu13-emailsignatures-cloud.codetwo.com;
Received: from westeu13-emailsignatures-cloud.codetwo.com (13.81.10.179) by
 HE1EUR01FT061.mail.protection.outlook.com (10.152.1.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Sat, 24 Apr 2021 11:15:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.107) by westeu13-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Sat, 24 Apr 2021 11:15:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3AqY6OXuAs1jETEIsupYA0aHeQo70amMlJqjWfbiareZgPkEP4y+ELzt8mRtH3ZA0TlM3quu2Ek/XgA4jLqqQIrjQtW9nwLgYSk/T/f1LrTD/d5h1U73B7XkUqOc/ATHPEuBFDE+DhHPklIrbuh6RV6/R0TAHKicsuvwwn61GZ3eALd/f1AuzkWD9tkBC2amu5E/OnaDhlO1S+3pqgTYHh5SBMWxNYihUOuPTa2XLiKW+PlInTRoPdB+1AiM8NxY0Ai8ebAl8R4BQYaQjlMhauv7075HYe3w5hHvfLbLeMcBKHspTWkriVqVxtJtgyYUPAdl+jIPQSKiBTqBa+vkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCIPvZTtF3ZYhQaTdKp5HVWznxn/3/SfdrtvkRTcnDE=;
 b=cw3OotLeTkJ3E01nm3Cqw3orrhzTUKUWtjd4KFVFpmpQL35tIjc6zU23V7GsClHXw/kofWzWrmtpCyqOj0mnyiJOoIQ3fQ5W9G7/XLN3QPbZlT90orNMOnQFL036WFAKeN+KF1X6so1LJFHOUdnsc52/WyYfmQOUIBnLn8GTgxRVZc9k+1TP6ggYFEKefMvZBXfK6Hzxey7HSiISmT/U2IgnDh8t3LBWDawMO+1T0dCbiTysFpixjgu3gNmqJL5KKYv7Vd5mE8JyxBFGbm5L4lADVV/7jDgSmfligkPWhSaEz4OHoCPMUjKc4QHZU43fZ1mfL5D5h1rGXvYAreIGsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topic.nl; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: leopardimaging.com; dkim=none (message not
 signed) header.d=none;leopardimaging.com; dmarc=none action=none
 header.from=topic.nl;
Received: from AM0PR0402MB3444.eurprd04.prod.outlook.com
 (2603:10a6:208:20::16) by AM9PR04MB7505.eurprd04.prod.outlook.com
 (2603:10a6:20b:285::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Sat, 24 Apr
 2021 11:15:28 +0000
Received: from AM0PR0402MB3444.eurprd04.prod.outlook.com
 ([fe80::8175:49ba:9d62:1d33]) by AM0PR0402MB3444.eurprd04.prod.outlook.com
 ([fe80::8175:49ba:9d62:1d33%4]) with mapi id 15.20.4065.025; Sat, 24 Apr 2021
 11:15:28 +0000
From:   Bob Veringa <bob.veringa@topic.nl>
To:     leonl@leopardimaging.com
CC:     mchehab@kernel.org, linux-media@vger.kernel.org,
        bob.veringa@topic.nl, mike.looijmans@topic.nl
Subject: [PATCH 1/2] media: imx274: improve v4l2-compliance
Date:   Sat, 24 Apr 2021 13:14:58 +0200
Message-ID: <20210424111459.20730-1-bob.veringa@topic.nl>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [81.173.50.109]
X-ClientProxiedBy: AM0PR01CA0132.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::37) To AM0PR0402MB3444.eurprd04.prod.outlook.com
 (2603:10a6:208:20::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from bob-OptiPlex-7020.TOPIC.LOCAL (81.173.50.109) by AM0PR01CA0132.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend Transport; Sat, 24 Apr 2021 11:15:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f02899d-0172-4e68-5581-08d907124580
X-MS-TrafficTypeDiagnostic: AM9PR04MB7505:|AM0PR04MB6001:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB6001F2411F6FDBB1D39D3CCA96449@AM0PR04MB6001.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ZMI+WTxjpFoinXY2b2U0O3EVTz/oEHzSruZ+9Zv+KtiD4MWSpnvOqaIR+oSqYH3+9QjcU9TzpBl9hIvgAINFtfFVogokuX908AT3z/jmtKDd/ERwgYga9x+nGJROmeIGikCdG/txhM1PEQsEylDATnp6aNoauSLnvMuI7LYSkJNYLwxNayiSBVBZqPM7AOVOzKxmHbQp6lV1Uowsr01fA3ovIYp5zLn5arTOYwZ0UVPeoklA6uPjZD7TMrdP1Ch5/z8Q58V3bV2BUoodTfq/QU2kN/LpyESmB70DiRBC8HLQAZaGzSh0r5WXIa3w4RxwT8dupSJKZ8CoBiIo/0Mwmi0se9HBoZcbgwAbqjb6PVGrWRJi6S+Pfo3tdxXNDrZml0dIKNtRkEtJusCY6FpABG/BG9ExAyP0hy4kUG+3F64qoteXEDfd7CfMbM/+8qLchEZ6FqCiiYVXqk6yrmL++BDsjyhy274y9P8bWBfbGapPJteKFZ+Q1VTVF1YBA6z969xWyGZpklK3A9LfCRBeNLiB8Kj/+aHs3pPUlwex/ZvLa2KzXEITRe1bTI2pmR/oG+EEES+2MpAYe/QXWLsYfNPGEV29UVdRBNNePlkFZchLlRCnRvt0vXbmF33anwpCRiIfCDvd7fUxgUEiU9wcvw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3444.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39830400003)(136003)(366004)(396003)(376002)(66946007)(8676002)(86362001)(4326008)(8936002)(6506007)(26005)(83380400001)(316002)(478600001)(186003)(38350700002)(6666004)(66556008)(66476007)(16526019)(107886003)(38100700002)(44832011)(5660300002)(36756003)(2616005)(6512007)(1076003)(956004)(2906002)(6916009)(6486002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DLSmVFVez1IuvA/H8GiIidub6rMcHQpcUV8mh2TiF7eJqeIz0Raz8rJGzgK6?=
 =?us-ascii?Q?yH6o0F/IKMDyxsN0cnCdX4YJtWC4iZ7k4URfuPGATrxLm/MzSpsmtBFEKCew?=
 =?us-ascii?Q?RtyAGYbeVH4KXLPI6iKJnbyoZbgAZdv4OZ9eNcvkAvj5+LkqOHhBf7jq6XvF?=
 =?us-ascii?Q?UplXY0q4ve3ct58+3UwuLHRpXBmvB0Ubi3L4SBD8f/h+e3QicUYxgjH2z7Wj?=
 =?us-ascii?Q?c3ZaSm5tF7C1rFwS4bwRoXjSUFEx8J6dMz1tCzMS/XOOP2kKNImV6zZh8u8n?=
 =?us-ascii?Q?nAlsdXNLXo89HAdjeHmw1MZE8cVllHZIeaNbzfNF+5XIDeLd1PicqA+NpD48?=
 =?us-ascii?Q?HDIXIBFy3jNhBLtqbsZPI9iHPclyHjwxsdxYTFHjrz+bxOvRgj65nU7irlOY?=
 =?us-ascii?Q?QG7k96amDuzdDceNe4sPnM0CjDCM0zlBsC1T2eNegIod3KCNSS7IvZzzBJlr?=
 =?us-ascii?Q?Uf0LErrEap4Yj5lzih45TY0r5ZWXE3+C5EdUT7mo9XeTeWSlpi7Jm9cxW2us?=
 =?us-ascii?Q?1fZejjpXt1Q/mMJAY6yzC665hkGmTRWBBfcFAtlQXrOxmquSJEnBsEjNVu6X?=
 =?us-ascii?Q?/wharGailwx0iLRQI3g2UA0aolfpLv0ZsyKmuTHBV9aIIVUZTHQuOXjDCEwb?=
 =?us-ascii?Q?tfYqqKgL1BG3QpaluO1QYO0HsN2CAwpFVtI2dtOqDhNe8ZJccKQvHyJ+v0oD?=
 =?us-ascii?Q?sAcXXj5UHYfly0MhGM+wPcHZxQM2jHY+Y6En21RSb9E7qZrJ6WOUIGEoWof4?=
 =?us-ascii?Q?ayyiNlBZ78swm/SCdEnGO56uX0pjlrTMEvBaAZJzsA1nbyhPkwHg53m56eyf?=
 =?us-ascii?Q?Pif6T8MmVTyJGCt7f7kc9NA3L6RCnKmudm/WdG6NAZfqNi0KAh6Ygip/2s40?=
 =?us-ascii?Q?S2Sh44rO5ZVcRfSgw+xqTm2/7m78T3nNBiAM2KIrJQeYiS2xIKXMwA8SRMs5?=
 =?us-ascii?Q?ejUAblx+rFkfFrzDXpnOuNwZ2o7aoeL+bhaE7UpiCVoXHQj9Scoyy3YVMWmN?=
 =?us-ascii?Q?K8Kkej2O5wYaInnIKFxaQetSm3Ggp7a/fjXEoSNcuHn4MajfJIA/BPJBxafW?=
 =?us-ascii?Q?pPZqfQ2LtaXhizH9Md9lrvUFqPSCjnpxIJ1Th/1nfntDS3gwnb6Qv5viLMgk?=
 =?us-ascii?Q?pKZbPU/6lI55vWpWisGsO19EMV2/h/ArN5hlN8Wrl9AaQp6fHoW90xdnA9l1?=
 =?us-ascii?Q?4bNLIm5JgoIyGr1VvHMAO/p6pC01aSS3TaobDo1+EX4lZP5SIV41FsB/3bDx?=
 =?us-ascii?Q?H2kj+M79Q67rkrWGZsYRycyjFf2jBi969/h/yXzCBiR9iErf9KtJdV3vo6F3?=
 =?us-ascii?Q?e9OOmrj+hsWPAGukAXgBYmd6?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7505
X-CodeTwo-MessageID: 09e5607e-87c2-4275-8c5f-0b87814298ec.20210424111529@westeu13-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
References: <b236611b-3635-40c5-988a-5c9e9fae4458.949ef384-8293-46b8-903f-40a477c056ae.e28b24bb-3436-45c2-9a1c-f2edfb40a571@emailsignatures365.codetwo.com>
 <b236611b-3635-40c5-988a-5c9e9fae4458.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.3cf110e4-7db2-437b-a373-f2dd879058a9@emailsignatures365.codetwo.com>
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HE1EUR01FT061.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: e9182ce7-609d-4ed6-c28b-08d907124411
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l1mpsnHSbjldJVAoJlEKLds9dSg9103erMQN7+/rhYL8BX/zK5jiC70oqL9BZn9PpGJAo2fyOs+O9/uWsX8EppN+d/V5EXqmLbUJseHyfgb2JTDdT+oStGQ7uY7xPqB6mHP4c21bUnCClTUqBlDgaTiTV32jw1v2d32V02TNVWJ4Uqm9zBOYSF2Nudj1i8yJzpF/kMYXNiKkI1aaNZLTMlpg3wCnQnd05Nr5ObbpmoKeMTJd/RRY0EIpKuFT6jgA0BIU629NFwFTGE8qzHVBAob/QZW+XJFLWURD2gmYSHX6xlAf+O9R3vKFJPlP5x7kwcSM4GpmINKXhzf1JA84F0eNelAVtxIkA0P74JE4C0oFS9pqbLDyqhRwoBGcmaElWzNiQQzjzSk8w3hs7sMWzDylJrm3DhD/dTq+HkZhDFudhGdAdbxwwOIEltjURbpuGyz0q7RZzIhxl21yv/LdnI5hFQr0O2GXucNBHJC4PfSoymyhIrKI0Yq/0JJgZBEKtMh3gxRMoetlU8q1/K5H0GuC2PNniS0/XKEn97m3CVv0wovNUmFELGR9G4FKsAI0N7GaqBeURuK3UqqiJrijJ4bRMaTGvCQxdxHr9eUkrCGezVa4R+lkcpoziJtHBn0UT4y294TtcWfOJlazwuSSC+TD0upeYi7xy3ptbndoy5KG1InNUcGf1/sIWyS4GqUVf5VWu5GlPXRlSGQ1CJt5ZhHNLKFf3+bGy832HgP8sQI=
X-Forefront-Antispam-Report: CIP:13.81.10.179;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu13-emailsignatures-cloud.codetwo.com;PTR:westeu13-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(376002)(136003)(39830400003)(396003)(346002)(36840700001)(46966006)(5660300002)(1076003)(82310400003)(36860700001)(86362001)(6666004)(4326008)(6486002)(478600001)(15974865002)(47076005)(83380400001)(70586007)(70206006)(36756003)(336012)(16526019)(186003)(7636003)(8676002)(107886003)(356005)(8936002)(956004)(26005)(7596003)(6512007)(2616005)(316002)(6506007)(44832011)(6916009)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2021 11:15:30.5490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f02899d-0172-4e68-5581-08d907124580
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.81.10.179];Helo=[westeu13-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT061.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6001
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

1) Fix incorrect return of get_fmt when fmt->which is set
to V4L2_SUBDEV_FORMAT_TRY. get_fmt always returns the active format,
but should return the pad configuration when V4L2_SUBDEV_FORMAT_TRY
is requested.

2) Fix set_fmt not functioning correctly when fmt->which is set to
V4L2_SUBDEV_FORMAT_TRY. When a trying a format the driver assumes that
try_crop is already set. If this is not the case it causes
unexpected behavior. Add a default value if crop value is not set.

3) Add support for enumerating media bus formats
via VIDIOC_SUBDEV_ENUM_MBUS_CODE.

4) Add  support for enumerating frame sizes
via VIDIOC_SUBDEV_ENUM_FRAME_SIZE.

5) Fix v4l2-compliance error 'VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL'
by implementing v4l2_subdev_core_ops struct with default functions.

Signed-off-by: Bob Veringa <bob.veringa@topic.nl>
Acked-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 drivers/media/i2c/imx274.c | 72 +++++++++++++++++++++++++++++++++++---
 1 file changed, 68 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index d9849d34f39f..942407ed931b 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -28,6 +28,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-subdev.h>
+#include <media/v4l2-event.h>
=20
 /*
  * See "SHR, SVR Setting" in datasheet
@@ -72,6 +73,7 @@
 #define IMX274_MAX_FRAME_RATE			(120)
 #define IMX274_MIN_FRAME_RATE			(5)
 #define IMX274_DEF_FRAME_RATE			(60)
+#define IMX274_DEFAULT_MEDIA_FORMAT		MEDIA_BUS_FMT_SRGGB10_1X10
=20
 /*
  * register SHR is limited to (SVR value + 1) x VMAX value - 4
@@ -1011,7 +1013,7 @@ static int __imx274_change_compose(struct stimx274 *i=
mx274,
 				   u32 flags)
 {
 	struct device *dev =3D &imx274->client->dev;
-	const struct v4l2_rect *cur_crop;
+	struct v4l2_rect *cur_crop;
 	struct v4l2_mbus_framefmt *tgt_fmt;
 	unsigned int i;
 	const struct imx274_mode *best_mode =3D &imx274_modes[0];
@@ -1025,6 +1027,11 @@ static int __imx274_change_compose(struct stimx274 *=
imx274,
 		tgt_fmt =3D &imx274->format;
 	}
=20
+	if (cur_crop->height =3D=3D 0 || cur_crop->width =3D=3D 0) {
+		cur_crop->height =3D IMX274_MAX_HEIGHT;
+		cur_crop->width =3D IMX274_MAX_WIDTH;
+	}
+
 	for (i =3D 0; i < ARRAY_SIZE(imx274_modes); i++) {
 		u8 wratio =3D imx274_modes[i].wbin_ratio;
 		u8 hratio =3D imx274_modes[i].hbin_ratio;
@@ -1072,11 +1079,24 @@ static int imx274_get_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct stimx274 *imx274 =3D to_imx274(sd);
+	int ret =3D 0;
=20
 	mutex_lock(&imx274->lock);
-	fmt->format =3D imx274->format;
+
+	switch (fmt->which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		fmt->format =3D *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		break;
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		fmt->format =3D imx274->format;
+		break;
+	default:
+		ret =3D -EINVAL;
+		break;
+	}
+
 	mutex_unlock(&imx274->lock);
-	return 0;
+	return ret;
 }
=20
 /**
@@ -1274,6 +1294,41 @@ static int imx274_set_selection(struct v4l2_subdev *=
sd,
 	return -EINVAL;
 }
=20
+static int imx274_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	__u32 width, height;
+
+	if (fse->index >=3D ARRAY_SIZE(imx274_modes))
+		return -EINVAL;
+
+	width =3D IMX274_MAX_WIDTH / imx274_modes[fse->index].wbin_ratio;
+	height =3D IMX274_MAX_HEIGHT / imx274_modes[fse->index].hbin_ratio;
+
+	fse->code =3D IMX274_DEFAULT_MEDIA_FORMAT;
+	fse->min_width =3D width;
+	fse->max_width =3D width;
+	fse->min_height =3D height;
+	fse->max_height =3D height;
+	return 0;
+}
+
+static int imx274_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index > 0)
+		return -EINVAL;
+
+	if (code->pad !=3D 0)
+		return -EINVAL;
+
+	code->code =3D IMX274_DEFAULT_MEDIA_FORMAT;
+
+	return 0;
+}
+
 static int imx274_apply_trimming(struct stimx274 *imx274)
 {
 	u32 h_start;
@@ -1903,11 +1958,19 @@ static int imx274_set_frame_interval(struct stimx27=
4 *priv,
 	return err;
 }
=20
+static const struct v4l2_subdev_core_ops imx274_core_ops =3D {
+	.log_status =3D v4l2_ctrl_subdev_log_status,
+	.subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
+};
+
 static const struct v4l2_subdev_pad_ops imx274_pad_ops =3D {
 	.get_fmt =3D imx274_get_fmt,
 	.set_fmt =3D imx274_set_fmt,
 	.get_selection =3D imx274_get_selection,
 	.set_selection =3D imx274_set_selection,
+	.enum_mbus_code =3D imx274_enum_mbus_code,
+	.enum_frame_size =3D imx274_enum_frame_size,
 };
=20
 static const struct v4l2_subdev_video_ops imx274_video_ops =3D {
@@ -1917,6 +1980,7 @@ static const struct v4l2_subdev_video_ops imx274_vide=
o_ops =3D {
 };
=20
 static const struct v4l2_subdev_ops imx274_subdev_ops =3D {
+	.core =3D &imx274_core_ops,
 	.pad =3D &imx274_pad_ops,
 	.video =3D &imx274_video_ops,
 };
@@ -1968,7 +2032,7 @@ static int imx274_probe(struct i2c_client *client)
 	imx274->format.width =3D imx274->crop.width / imx274->mode->wbin_ratio;
 	imx274->format.height =3D imx274->crop.height / imx274->mode->hbin_ratio;
 	imx274->format.field =3D V4L2_FIELD_NONE;
-	imx274->format.code =3D MEDIA_BUS_FMT_SRGGB10_1X10;
+	imx274->format.code =3D IMX274_DEFAULT_MEDIA_FORMAT;
 	imx274->format.colorspace =3D V4L2_COLORSPACE_SRGB;
 	imx274->frame_interval.numerator =3D 1;
 	imx274->frame_interval.denominator =3D IMX274_DEF_FRAME_RATE;
--=20
2.17.1


Met vriendelijke groet / kind regards,=0A=
=0A=
Bob Veringa=0A=
=0A=
=0A=
TOPIC Embedded Systems B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 79=0A=
E: bob.Veringa@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
