Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBC52DABDC
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 12:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728888AbgLOLVg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 06:21:36 -0500
Received: from mail-eopbgr130055.outbound.protection.outlook.com ([40.107.13.55]:20100
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728854AbgLOLVf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 06:21:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTt7zLlt7g/oZs2HYIHTay4cZ8lBqGUs0GQne0doo99/6yE9bj7yot3lW/RoX3emuBGT7nCSA4trMcOEvwlZiEsKuaxHxOfo+xIRXElQ8Ei126nCK0m3/TTMeO7ZX+aQi0Gc7YA3h4EKJklPWZJOprDiKljdLqTHbdzhKBUUhE3/R5BGdtpk82dH1rJFdNbIPZEXXhcOHh661Azvdbf0DOXuEemk/60wm8X1xARt8GF1gyj68Dqqv1X4yMXGAxKh/b50QKyugLB5reJ+6MHPfbGzagE58AuclgVKBVeNBSC9SlQrDCtuWEjwy4CSLVwc8YHHqNiv4EFtH+cYV0f16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KghkZQWwJGcloTq8DR4we1ZoZeJ1tO038dIYHMaEWlQ=;
 b=iiEbYcAdWiflilqgmgAQJ6+Ic4GoGEsYqjaNtiLlVG7HFKRW/ZBTFLyDHn6jPazm6KHxO/FSIVJpVlD648LZElKdBOb+VNE+wEv1u0k7D4I9wtIFIMmXcLGvE4rGgaAxh6v/JUtYUMsu6jY/H7LHcyJxmlU7Hq/LRq3cN/dJYPc1ERtoF1yHjMZuEucrpeRjZU24fcBFEBO4UXBGq+kTH5lz5OiiyhXjI3HfJXsSzo20GmUwDSwippHjj97RpIruOC2K8zuYZjZMik9g/oKzKEJLwsRn0tkAw2C7mOeJh9NukNcw73LhZhBLPqujFf/CARDU95LIJHczE0pW3cYreA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KghkZQWwJGcloTq8DR4we1ZoZeJ1tO038dIYHMaEWlQ=;
 b=iKeSONV06Ny2BNqjQ+DZ8HhLGsWlYfWXGMlU7SEON0gDK3b/WmaFKWSRNwPEMjgy7nN+Nrafc5J9fWwZd4OmVKUfuvF3OUQTbsQPZPY8fAS1EPeHcZFIEHzBpljY/cZpmVmORuNwoUzhdCgrFs3INGDK9M7AHp7sh9wyHUZND/8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM5PR0402MB2737.eurprd04.prod.outlook.com (2603:10a6:203:95::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Tue, 15 Dec
 2020 11:19:41 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3654.024; Tue, 15 Dec 2020
 11:19:41 +0000
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
Subject: [PATCH v6 8/9] media: Avoid parsing quantization and huffman tables
Date:   Tue, 15 Dec 2020 13:18:42 +0200
Message-Id: <20201215111843.30269-9-mirela.rabulea@oss.nxp.com>
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
Received: from fsr-ub1664-134.ea.freescale.net (79.115.51.151) by VI1PR09CA0178.eurprd09.prod.outlook.com (2603:10a6:800:120::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Tue, 15 Dec 2020 11:19:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f159c2c3-a6fd-4d43-36a3-08d8a0eb513c
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2737:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0402MB2737020BF55F880AD3F1886FCEC60@AM5PR0402MB2737.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: otx54P1pIWQwZ2a54/gDsuKtLpPhYP7TkemU4ZWXoCYeHYTJ2fx8ia3o3q4R4eLWJLuiLTNGB8GHscppkpUB7HBkc6DqrZX3v4KBxsN4OoVUbMokKe2IccT8g6PeB2tXaOPCia8PdDrHMnk9bz1Gdlv96YDJVZ168lu2PxDoOs7st2PgRWYmt13BffDdxhVCGtaPNs7ZZIzwamtE3Q3f1VurTia4c8Qp6GLiXXLDOZ3CDt8ne2tG5TtWJkqoLOufPaCKtv9zcPHe62+DNZqX5kkPDODD0ff+ztJYcZ09UpLV6btNmOWJ7G8McIc1Q5ej6wiTt9GCLSSJBQ5446kTJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(16526019)(8936002)(52116002)(2906002)(1076003)(956004)(66946007)(6486002)(66556008)(66476007)(498600001)(6512007)(86362001)(8676002)(7416002)(83380400001)(6506007)(186003)(4326008)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?LO+9Bq1ZJc4uJ9NgDN+zgbpZjouFU3hKSHUZwGK6hTx8qn891RYpWva/BEsl?=
 =?us-ascii?Q?behr970hbcqoGOcHFzLQixTHu7/2AKpPYvEISf0+DxfWaevYRBgTRFJ8m+dn?=
 =?us-ascii?Q?n0vgd79SquvLQ65lMWKuCu6PqoSHllL2jV6eQrDHbq+SoYm+5jtOInJwv42D?=
 =?us-ascii?Q?bYI1UwQAukMB7PpzIos5aMd9NDjXhm25NrPwaqzLCED7YPGR0LkFAOYJ9JL/?=
 =?us-ascii?Q?QVb/LXj/Q5b7EZMuiX8oCXDpH3EBFU+O0/Flz1SbWrs3E2ZxlJW/ZexQmeGG?=
 =?us-ascii?Q?J+6emdeZUFU8sFfZ5CqhWwqa1hb76Svq7I0aG26OSlvXIElZLrvWRYyKnuEk?=
 =?us-ascii?Q?UPLboiftosqIVAenaq5z9tVV8+l0ay3TEE/AvhaM9OE/IaGZv0Y6xoNjU/QC?=
 =?us-ascii?Q?boVzHo8pPR4xne3on2HmECpnVsvcU6nN6l0JHKNEKTR85xDkx0agxZ4Ed4sc?=
 =?us-ascii?Q?oyRFhAoxuljCssYeppZLcG6xJlT9QXemoLQ2E1g2nhXKA11LU9SoHDkdbUII?=
 =?us-ascii?Q?AOJX4hYKqhDzdfhksIsYonCopNSwSIMJcsPvRU9qk4r/Iis8AD94DSmT7IJt?=
 =?us-ascii?Q?Zim2c3kXEY1LSuVUf0I0T+aRL3f4pb/HBJHejpvYTC9AbQUKojmbhR9iuOWu?=
 =?us-ascii?Q?qpi6TN3UMyxK/qsyAyvrdqRIqGHB2bb1dTup1au285HpTDDV//1WEkX3mNsO?=
 =?us-ascii?Q?rhRH/AzmPXVWDKl1YfOUARCtiTxoSie/woidLkMyabB68QGRs77D9TzHeqPW?=
 =?us-ascii?Q?D6SAFpNsH0DIoGmyOIvGkWwaEB4r3eVqPchOnkNW4R4NfOJOZjs7AefapLFC?=
 =?us-ascii?Q?MCoaoStawYPzlnDZPToKji9gRR/EnMM+UCQL3LYkUWNOrPL6Nz/jVZB4cPG1?=
 =?us-ascii?Q?UOlp4rEKuzbkO2s1NWpcFgBcbT095jC/FCV/hr9dACFDptwVbflo63v6WEIH?=
 =?us-ascii?Q?rNcARUiPh/wjDwjhGWSg7sK7TyaKdiRTwuil9Fzm+bXsubkuim/jRaw+bXO9?=
 =?us-ascii?Q?9TKQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 11:19:41.2844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: f159c2c3-a6fd-4d43-36a3-08d8a0eb513c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OnlLGcewwKvq5ZSxlF2zOvK9FFzvjwc5ioC9bjsNN8I9JYvr+vYO3TC9Yr+wrwGK5DKFTeuXxhppk5fq229dYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2737
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

These are optional in struct v4l2_jpeg_header, so skip DHT/DQT segment
parsing if huffman_tables/quantization_tables were not requested by user,
to save time.
However, do count them (num_dht/num_dqt).

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
Changes in v6:
  Call jpeg_skip_segment() instead of jpeg_parse_quantization_table()/jpeg_parse_huffman_tables(),
  when quantization/huffman tables are not requested by user.
  Remove the NULL pointer check in the lower-level function.
  Thanks Philipp & Hans for feedback

 drivers/media/v4l2-core/v4l2-jpeg.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
index dc9def4c2648..f3d03d39defb 100644
--- a/drivers/media/v4l2-core/v4l2-jpeg.c
+++ b/drivers/media/v4l2-core/v4l2-jpeg.c
@@ -537,6 +537,10 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
 					&out->dht[out->num_dht++ % 4]);
 			if (ret < 0)
 				return ret;
+			if (!out->huffman_tables) {
+				ret = jpeg_skip_segment(&stream);
+				break;
+			}
 			ret = jpeg_parse_huffman_tables(&stream,
 							out->huffman_tables);
 			break;
@@ -545,6 +549,10 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
 					&out->dqt[out->num_dqt++ % 4]);
 			if (ret < 0)
 				return ret;
+			if (!out->quantization_tables) {
+				ret = jpeg_skip_segment(&stream);
+				break;
+			}
 			ret = jpeg_parse_quantization_tables(&stream,
 					out->frame.precision,
 					out->quantization_tables);
-- 
2.17.1

