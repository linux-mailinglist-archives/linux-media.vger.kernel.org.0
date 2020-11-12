Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2B12AFDE9
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 06:32:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgKLFcL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 00:32:11 -0500
Received: from mail-vi1eur05on2044.outbound.protection.outlook.com ([40.107.21.44]:36416
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728062AbgKLDJP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 22:09:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KI6iWeMiFj7LCdkX+5dDifOP/Bf9SoqmnEQBxvMNN0Yn+f3Dt0sZuOBQAgJsXE8+LfMe1X3XCwn9Tf/5eOMad0i8mDTQfwuvUuT1WX1YIJDQOxB/rqYSCBMYITDWCxy99wQnVvegjlkhL+lsl54AuFxxzd0pdVTi4jn8T1m8kaQQYMVIC9yMTKx8JuieK1zc3DIpBCMVwc7pzWvRyitKyhhGudp9tny0N4NAl+Q2Y/7rGU59hmXoe5dGZlAod6XIummBrLJtdOutQo65OLJAXaWSV2i5a0UdKr4AMTiRr6UJ6NdZaqpm//Gyk9jZWaIfFtz96gsVSNnbA9jsr5Jpig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWsCx/qYQ8TgnvLg3poctEK55oc/U+UjFaCkYLB/naQ=;
 b=iAhpXJLXClPNAkH+yKvkqiBHXORTQhPVe8FQn9pxnxOAW1WnA4qIaAuaenkK/5UWX4yfvmCThba4gkVwFuyC6dbVvF1CqIklHsB4aoynyMrH8rnbkRPXfbMui/VBueKtXQhDmttGKxUaZFCO6pE7yRId5zh4pfcjYnhmkosJNHrOH7ulpqPTLKPL2WiHYQn/NUHqFrISzhf0fUzkfySq0SaZ95L1PNHcPGjGGrylnNSovAmgFgF2duuZKoFVe82bbDpdwjo1jeoSec+dHQbEVgKDa2jeB7IpfrFpkf0Nl9PiYx1AC+6fdPJv31NZHjY9WXL/rNPe892Z7VBez6p7kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWsCx/qYQ8TgnvLg3poctEK55oc/U+UjFaCkYLB/naQ=;
 b=JuVQHKjQAvs2KBb7Y8Nlc5IcSxcJGX04B/Td0GDs7Ox2NaKy3vcb7A8rdrqW5X1kr1PQSoZwXHwPLYIubyrcOry6P3+oRtdFiI8fImZJpPiSSqsXG7I4SUq7KI3g/U+05K8A2nhg6ae6sMCrC6ttOtvJrTzLQcRxSLWWGzKPfEw=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 03:07:09 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 03:07:09 +0000
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
Subject: [PATCH v5 06/10] Add maintainer for IMX jpeg v4l2 driver
Date:   Thu, 12 Nov 2020 05:05:53 +0200
Message-Id: <20201112030557.8540-7-mirela.rabulea@oss.nxp.com>
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
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.138) by AM0PR06CA0100.eurprd06.prod.outlook.com (2603:10a6:208:fa::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 03:07:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 962c5732-a296-41e1-6dfc-08d886b80add
X-MS-TrafficTypeDiagnostic: AM7PR04MB6997:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB699764007D600F46E58953EACEE70@AM7PR04MB6997.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xsEvTy9R4P/+lFFOwBZ45DWodui2UdCRMK8EtMIf6NYydMuTlj+gR65jSXTf3KEfL/0W2qO7MoP1TJmtXirhKY95KuBLZCmk5fdlzdC8us+efNcmvVI2wUFFPC8JzR91KfYWQHEKHZ96wNTm/1UY3F01JIgYoyeSjF+cdj55P6rRs82pnT+gAu+9T5Jcyt0SsX6Y33Xfr3CMNZ6/D1F48da2aPjBXbrxt2sUIOePr6ebqbEfsMofflk1SiBzfCY3t/ikzPvoUTeaRgV+YLPo6a+iAhDYwNWh5Lyg64+Qa3bBMqZPOTZSXhxtfkweQxOHq96VL1NZPfhG8Y0Qe8Q1Xw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(6666004)(1076003)(316002)(26005)(478600001)(6506007)(4744005)(4326008)(6512007)(66946007)(66476007)(186003)(6486002)(2906002)(66556008)(5660300002)(16526019)(8676002)(52116002)(86362001)(7416002)(8936002)(2616005)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: gdnnvKAp63nM0n0Tr12sAEoG4cR4F9Rm2lfkmlKy/GuO6fQxf/GXzbYR5QzLEe7zk9INQ++rThnGIleyJPU0JwScyp6+s6FLGFDqHNPjbAfT7O+cCJEZjbNdWZFW8Yj5qG2HDfJyni+KzAl4Z1Lsi5l+RBn7GxLj2ElXiu45trmu2Y8g4M6TTjWEkYZbPISB+d8jB+iKM42NCSEb7dQyTlx8nBO+Ma08EJCSzpCTo0AlI/Zk9y962LhCIIhT07rfsxGRf9tTQ0CwiF9IQiChQuKoppn/BGLWATPv9i/Hd+NOi1znOfIxzIOMknw3iDDMymNE/qFsBBcrjbsrggk5OpnrUlP6gjxFB5S4rvUd1sCENKRk+GGS7P5hJ7X0mmxZ8kFYgPbQh2RcieyXmB3AI6KcV+2KOzOGL04IXfamNAvl78jUvLlONpg0myV1QqPhDGoouSt79G/YRpIYW4QkUrSu34iw0nNj1hM4CBn9tk1wBNu6APvYEHWSpHCqJ5+k4J+5rxPE+xHGt9VuxQzCcSH48yhcaEe/N/47YFR362aK9rB1ytNCb26C8D1EKf0eQJBQTL3QSDgJQ2eVL/5IhgbBEqjXSsggxKrrBiXxTF8AxRJjQg41Qe9eUuRuG/LNJ0r4yOw9M/DRGR8EUOYp5AmVvCXX5/BhjiyfVQuCj9Tf3sMKcuLLgtWIie58XAl1FfPYB2IsMiYX90uxT3UoCPqjie2MHuDctB9RfCwasod1ZZBtRt6/RTDqIuGtgawcYTESeBxqIcHZRKufBCLEB7evneAc6f+UGgtTrnCqdLcc4Cbn1Y9yJ9ufu0hhrt+tLGfjx6IxRtvR8br/HirxiPiRmR55A/EyP6OKLQjksMA5QyHQMs4ugjmhpMzduZ1z2ZFYOabEqfVqKv0V9it+dg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 962c5732-a296-41e1-6dfc-08d886b80add
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 03:07:09.1111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1VynF6+G94IGC24R712woogkvdOvIH22VdYTIZv22//U5GiIV0XVs/BgQdBW7+CUq9Z68i6SkwUUVMNIijq12w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

The driver is located in drivers/media/platform/imx-jpeg,
and it applies to the JPEG decoder from i.MX QXP and QM.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
Changes in v5:
move to NXP section in maintainers file

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f1f088a29bc2..f4c9b53d9077 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12692,6 +12692,14 @@ L:	linux-nfc@lists.01.org (moderated for non-subscribers)
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

