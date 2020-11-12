Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCF82AFDEB
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 06:32:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbgKLFcP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 00:32:15 -0500
Received: from mail-eopbgr00050.outbound.protection.outlook.com ([40.107.0.50]:15463
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728074AbgKLDKN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 22:10:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuirehO1NHfXjvyZNUj9tZMDRgXvg47+sLzdZW1Ivwm1wVVT74MLyjmmU1iqeUOM3oz3cKvUQGSRCGcGyOpeBZRbzjxoy92zNctvQ3FxUJqN9AZY28qrmN/CY6GRHB3XPUDMuTFoACkt5S4alS2dWsysNQJNW2PPdWyKlAlpLHdz8/Il8Ib5mB5LtDiXKNu+v03CPyLZIaB5YGX6k8SBA+PPHC9dKP2STW7herC0yu7NfCcL8RwKwtiRRAY+KHF7MrTX04IpF29ngMK4cG3T5m2rP1c5Xv1p1IN5PKh3C3BkFWDQfyebDpY7aBsXgeUM8sl9IEk3Tqv5jUJtc6Kt1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJ8YCQb3ttORNAwWOOx8YlFqpmO90qAQ8LCvXlzv7KM=;
 b=UET3qM1hyaNzAJJYBu5r1jEwxHTuJJX/Q2lxTg2NyvxCfYE+u7BT6u5iLOSKFCXWlMyXAl0Zrv8RU2+nNd3Mmlgqbr7AdJWuSG5KDamgAhD+BxlEyWQS0pZQjmTkQttpq9spp0snhbZNYjQRy611X83/DUYw1CkldTiI8KAjfOVCFkQ4mvbpwL+rqqHfapLZ0AcNQFqPeGK9coxkceulnKcybhIKHhpNg1T/Ecc+w0Bthu3KjpEZz08stqIcoRzoBmO+khAEbVcLajlDvXRoKuBF+nFItIlbreC9OmzYC1ZnJsxXzu6Z3YcvIWh7J2BsnYwJof/tXXRiM7AOK/LTRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJ8YCQb3ttORNAwWOOx8YlFqpmO90qAQ8LCvXlzv7KM=;
 b=Ggkf/hvHqop1sqUhq2mWlJXzRR4c8WxeOWnCzETsjX6SiN4nvpKcGkui8z+zz5IAejrTz8hdPB3c96ymmHLFhkt+cmmwXrtI8nOecWjF1pqYDljNu/BC6WKBRhi1ijSBlq6L3ceXiD9oayvQYS+7nf4qtmSpfBJK44whlsgwd4Y=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 03:07:17 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 03:07:17 +0000
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
Subject: [PATCH v5 08/10] media: Quit parsing stream if doesn't start with SOI
Date:   Thu, 12 Nov 2020 05:05:55 +0200
Message-Id: <20201112030557.8540-9-mirela.rabulea@oss.nxp.com>
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
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.138) by AM0PR06CA0100.eurprd06.prod.outlook.com (2603:10a6:208:fa::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 03:07:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0bcec7bf-2122-47db-a436-08d886b80ffa
X-MS-TrafficTypeDiagnostic: AM7PR04MB6997:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB69970E138FC0BFEFAF35BDAFCEE70@AM7PR04MB6997.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Fm9bfxfozgo7s4qUcLJcp2LGpLAyL26wDumGgIZeMMJoaF/S1zGsHaCxy+9PMzhjVyghpeTDwSCt3Ibv2Vo35lxVvJwuV7lWF/XohlY5r9gB/bpGLw7xHwLihDK/+nk3a40TVbqsQMCzdVmD0H3gwJRoMnlQiSdTf148isLasLN3lZKS2QEPQOXkYHveKujB27SZoPQ46L4VWCjGBK6apct+nqm5IAjyd4TTVDDt1KqpSGt1uClrLW0vNp90ONJ73nD+40mY+VwCVru1LGzHyb001010UQBEqLYWW4YMonKU6XvEDFxDGNAFUBh2p/yf2JaKjbBOkgAuCRovBFS+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(6666004)(1076003)(316002)(26005)(478600001)(6506007)(4326008)(6512007)(66946007)(66476007)(186003)(6486002)(2906002)(66556008)(5660300002)(16526019)(8676002)(52116002)(86362001)(7416002)(8936002)(2616005)(956004)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: NWb8Z2NfEmEDQnpcClaP2hF2fOEMfMzDe+Gb1JQtEB8Wri7JcDGQvhCnAOskpch1RLjoYMLQOWQgFw+tyvI2YpZzmvd2JpCfnYHg5bkOFOI8K0RlF/HjisaU4NkhlnM00Bt6CLr8V6t7SWv56CFtcG5k/cJIzkku3jFOO2jHPz3QWMqMy5BzkSFICTmUaITO/6K4aXE2/Gqpt6AJ44DAKM39uF6k78W2J1nPyUvNRsBkhgGEFf2BS3/F77j0CI7/UQ9KrjFuwZle2Sr8NYJ6co1XVAJBBPc6OHdKHyfWWOLUKlGbinyeUK7gtRWDZjd+J0VE532mTRH5zj9BcmbG1WvhKvz2L1ghB1P7gD+d5TdAiiXkAbqnjTJMmFLsiFL63J4UUdrRAuemRfOKrt46/2UD8NLjaRPwBd/KW6i+0h11kkYUGpTng5QlExBGFeGsXVLOkVAT5KLYasgtM7yXRgEAkY6U2Hjw/bw3ot3WWZeI1UzYtvg/T1wUm7L8GNFkYYRV+6D8Oa4E3rEvJLtzEwJfeU3fUZAs0J8G2EutYwgrB9NJEPK/fcW72b9871+n81hUyYqRqKMyDcxnpQcxuhWMolxvJ5dSR/AINs7OjM6f4WM3f4Xk1sYxsCVcBsyuYmwttDJ5THBaGPyfotQIS0M+K7J4MtKcKTQJiBgAAPibY9aEQtpLHQiuvQ6q6GES2HIBJA1TuKE8l+2f2p7ZnxYiOlrV7Dqw9gz07TVU051+yJxQEBGDmy60GlsPCZsyxORlx6OKSrNBcVBq39hhEUNajUQXAeshYF5HtACUqVM4bZ5VTKNvyRRVjM6dtoo7F5q8gpta8CHL8iOkhhpCCgVzoBr26HO0IB7lDz7jX/De8cINKYTBEL6TyZybDTpmCAw53WX2tqVfB0bjD8hMbg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bcec7bf-2122-47db-a436-08d886b80ffa
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 03:07:17.6721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lqzrplyrqpYPeDrIcMBupL9jc9T2euh9rd4j8zvfgGhxBJCeb4MWGALtDCjWmS4Xm3ueflel+tx+H1xeqGL5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997
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
index 3181ce544f79..d77e04083d57 100644
--- a/drivers/media/v4l2-core/v4l2-jpeg.c
+++ b/drivers/media/v4l2-core/v4l2-jpeg.c
@@ -499,11 +499,8 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
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

