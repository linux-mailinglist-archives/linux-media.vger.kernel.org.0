Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D756A2A2353
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 04:10:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727943AbgKBDKf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Nov 2020 22:10:35 -0500
Received: from mail-am6eur05on2083.outbound.protection.outlook.com ([40.107.22.83]:60192
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727908AbgKBDKe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Nov 2020 22:10:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6v17voBbLJtf8OLghCbHPP5FeZVPUNGJmhZr5/qAECzRUBgC3Zc4LNiYV0fIlJxm/KWoB8bBz37yCaXlwaU4P5K66zW3oDG4S56HaTuisgpnBM342xsd++I8wgfyibzOUQSX8uKCpI1Wx5aylB9VozGSeUp8xQCM6pQt/TxqutqUmHZ2y/kEFWK17+AZ67K0iWGjyzfzAU0FhrKaM761iUQS+flycMjSly/hpjGl6h3FFvzocg+nlAHpwEft2yHOGx1iBid6RMtcpbbB4lwF0oz7amrfxz5+ucWaj/zdaIWQXyFAtGXs37QBMLyJLsYQ8R35vvsKmar0d4b80/zWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHViFV9Q3waoAMKcQmF/huSPngMu26WkcFNEdvDXlnE=;
 b=MqW8qd3ABbSlRpasSDfcdxAs4P+YH+/CiDPTqWQuZmX86JFX+VSRGmU+cs0zlT3iObWzDc1BiCZiiiFYlxOZtb8RhWiAZ6meELWXAzv6xKdE7m2C+lXBGmO6DVVBuGGXOuLFqojkN4L7wEMOtn+LqCPOyKKAbG8qpLYwmg9Myodue4ZCXRMHfXT9kK7uLGTne9mzf8Rn8LIUw4tEnbgcOUUfdUZpDNbgWbEW0w905wPvp2sR23B5BZgY/9o5zU/NZgbbK4eWq2lEtN1AQFwTB2QkgHX++J43Qw3JrUyk09yaWXWQ0Tiz6bz1BEkf8jo7ztDudx2qIIDhhJhBARz7Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHViFV9Q3waoAMKcQmF/huSPngMu26WkcFNEdvDXlnE=;
 b=afByRzLr/CmJu2SJDtaxc035IIKBRjNQE1HhCF2b/lYHtqE9H0Yjyyxv9zqKH0kG9yEi0K6CMYQZUtOoYDe9BDnPm3eWnMIHXDXB5U4601W1ntv5W51s+9PulFoIOVfeOS82i0IkZZ46C74KY+27GmFRkyVkBdSo16QoFP07m8g=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB5173.eurprd04.prod.outlook.com (2603:10a6:20b:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 03:10:11 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3499.029; Mon, 2 Nov 2020
 03:10:11 +0000
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
Subject: [PATCH v4 10/11] media: Avoid parsing quantization and huffman tables
Date:   Mon,  2 Nov 2020 05:08:20 +0200
Message-Id: <20201102030821.3049-11-mirela.rabulea@oss.nxp.com>
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
Received: from fsr-ub1664-134.ea.freescale.net (86.124.170.94) by AM0PR06CA0128.eurprd06.prod.outlook.com (2603:10a6:208:ab::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Mon, 2 Nov 2020 03:10:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f522cb59-9174-4b7a-865d-08d87edccf47
X-MS-TrafficTypeDiagnostic: AM6PR04MB5173:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5173B7B5C89568B495B05DFBCE100@AM6PR04MB5173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /GcEIXBW09S42YjoExswiMpBOeJOBu4XnnAKgr92gDeuuHfjTaKfngd1lVagehgnrDnfBHyeTruRoW1pbsoGq/T8BZ2L9Uzgv9+T9xGzuQfXHLnasEcawNjNrbbIDkQkEdW16cUaoPX2Z5w1EoKu88vnN569IGDqgWhQ3ik7LgDX3dMO1PteUPBz3MCmZess8fLzdMTdcR5lwJ9QHP46jsc1pjqH6FUCtHQdrttqqs6muUeaL//LTQf6xkVN/tJGYU4EIMQDywyesaICENZpczxmylg2Ftn0bB3XIwM0FQa6P7TAYfPIVdEcQfFAruyl3xHEvdNQy0JvtTcSXwBvVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(5660300002)(478600001)(86362001)(16526019)(186003)(8936002)(83380400001)(4744005)(6512007)(6666004)(26005)(2906002)(6486002)(316002)(4326008)(66946007)(8676002)(52116002)(956004)(6506007)(1076003)(66476007)(2616005)(7416002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 6G71P/6GqB2np0ct0nXhg3DUkp7pCroqXhMtWG5U59T3K6Ca4cLjQmBjfpMTIjoB2ocnKSjygzThQT4Wt1Aqud1qCQz6B/Srhs7orLvwcQH4KF8xAGyjmjq/ndMRB4jGsVK4mnAvNzqhycCF9aSEBQZlEb0D72x30YBtmiuGVPQQw/AUZCcvIP+GQ5YnbAMVggeDotR25k/tcfMuSgAWojn4iQUyjxb/qEeM7002OCLiwdJK555ayR+daLPLbHReAj5rktyEaWeG58OmpTxBEFybUynBYuqhl3AKEZaL1RgmqgCkI9gKxs2Abzj984sw/yjoIGPnG832IWfkXjtWinkq8Iv9uEazeLfCaCbc+9PmR3TiAMAhKTck4srkS8/dvKs72CbtBj+wIFNEZKdCdRcN50YAmd4XPfNpbTms+Tk+x4DlV5iEvDrBy7zpio7beqlqJsmDo5KH9l3G30T3k+/xWuu1ii7iKFNhKFdFu9jrJvOQs0Xw+ngINKL8cIkQuIr473oGkaUHY+sq6wVkQCxxsJLDFl0mEce3NOuOAZdkDClekGWfqSYOBtoeDSJF7msaHf+3GbSv1+LrlFwivm4fxJkCKzqOHBqh2nOumAH7F7SG/ESwV9LkZf2IenjsdA/PJoJSVcqBHhZBgnOFPQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f522cb59-9174-4b7a-865d-08d87edccf47
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 03:10:11.0969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2WIIUO7jVvt/t1gi/9d0sB8KoecY6yK209qwj0nflg9n62oUlWOK4L4cEo6vZqn4cHspHDyXlY7Pnwz5q1GiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5173
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
index 244feccc4ea0..afce12822412 100644
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

