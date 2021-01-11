Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F34C02F1F65
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 20:32:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391055AbhAKTax (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 14:30:53 -0500
Received: from mail-vi1eur05on2062.outbound.protection.outlook.com ([40.107.21.62]:26273
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390932AbhAKTaw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 14:30:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFZcIUA7loVftQx3h/MCIBWYoIFItlWJO2E0mseqwP95Bkr6STV3glEN4VLEjUy7hkmz9VIEpauTDsLalFRCJXFQsOncftbgUx1QKMSHYVQ/nhcJAibc/m8dkfv3paqGcShwTkEs2PWgEV0UezRKZdRFFL9I2QoSepGUnQvKauOvZoh4HzdK0Lp+h5mdHqaYB6JZHUYLAIccVQ5U0OTF04ujZWIVhIpcHbbYQaOcMPxflWBa/ud3QM3gaO3ICk12emUh9xW/wKfmwFTwaxGUJp1TjxBU/WkXfNlpB7SC/3CjxsHHFvwIdHb21ppPVl3wXZ5kHGnurFe40sXtsQzb8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBbcmOYBs9jHIjyIXTBKEh1J9XdtHiYTeQEzaPp95jY=;
 b=mqnP86OUbe1Kz4Qb/3a9cHrX72q6n9oinsYn+zIBBX51igQKw2Ios8rkzCIBmLbK51g4Y1SMU/hVVpNx3CuDKdOoIpr4zezAE1h9zQ4/uItnJ5Ok4+TZ1JUe67YJHzSCFkKfwQXTbPzVyahzzbpu2Znl/RF8oWjstLMrTBwa4QFSdwvU4v/zzHjCB1K3gG9YszuUT8CejrMHBXHX2lyoG5RWIO5p5zCJAJ/c3J9YrNlkGOcyvPQxQXdtVOT/lrEexpVEsaFpTUEhpnhCN1LE+hzgEVJCpGrPhoeUf/nrO5aPglA3fCKZoACHSxymKV4JscFvh4JcExSOv9ly7oL22g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBbcmOYBs9jHIjyIXTBKEh1J9XdtHiYTeQEzaPp95jY=;
 b=BXe+frmOW6NDQYBJ8gJTqEzXb9SaNzOInXvh/oRr2ooSduk8ryZETTkSHRusY/hfp2ISDkT8XZTMDhudoFFx2zIgo/PUvlwOSLw3+ktZiYT493L+IZCYH6PR2UX6UyJSf9kkKSEHgQdUx01rnKbJnN+GtiRf1p7eQMeKkAKJvx4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB4424.eurprd04.prod.outlook.com (2603:10a6:20b:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Mon, 11 Jan
 2021 19:28:55 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%6]) with mapi id 15.20.3742.011; Mon, 11 Jan 2021
 19:28:54 +0000
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
Subject: [PATCH v7 5/9] Add maintainer for IMX jpeg v4l2 driver
Date:   Mon, 11 Jan 2021 21:28:18 +0200
Message-Id: <20210111192822.12178-6-mirela.rabulea@oss.nxp.com>
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
Received: from localhost.localdomain (178.138.194.64) by VI1PR07CA0296.eurprd07.prod.outlook.com (2603:10a6:800:130::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Mon, 11 Jan 2021 19:28:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f68b3c32-23ee-4d55-bbca-08d8b6672211
X-MS-TrafficTypeDiagnostic: AM6PR04MB4424:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4424AA129D4C29A006502BE8CEAB0@AM6PR04MB4424.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UyYt9l+Qr1hx0rBSvBjiCahb6oJw2ugxrg6FBkeoYJMgzrxd97XgaxnCRLR04fFEUmvfQz9qMDrcsRhh4RlsNRxSvvMWC8AIvSUIoe7ZXOFmpRO20ERrus8UA7poOfYo8QNM7Ie+KXlegW/3vzLOPATCB8hl3ccR/Dzkw+G+E3ofmjABL1gj/tYraSgZaBWJTVJvtLiZoCwpboolBcYwHzXAPxV1zFEnoxx6yXD8uwDA4LWw3biquS03KIeMXKJ26Bma85SQck0QEvJN9zmxkv3tfcy6RcMsi9j9Tu5ZnMZo2DpChuEq9RLQOgTGANhBTiRMrW8OfuVpNN6dcrm1DfEEpqR/RyF27eUZEMNIsheDIet/unXUeW1cf2UEGH+SPGhdsRpL6kR+k90V1IRVy02imtEax3hIJ43gThDkr/iTGC61+EGvbelELQ94lWiX/9d/H6ElCS1Hdwy63azsfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(346002)(136003)(396003)(6486002)(6666004)(7416002)(5660300002)(52116002)(66946007)(316002)(69590400011)(478600001)(4326008)(66476007)(66556008)(1076003)(8936002)(2906002)(4744005)(6512007)(2616005)(956004)(44832011)(8676002)(26005)(16526019)(186003)(6506007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JW+SqfOyPczlBCLHX85vK+793eD9GTmQkbzrohJU0BYh9PfiKBp/g3fRrvu1?=
 =?us-ascii?Q?ag0PqL7Ow+uD01QE7hxYCOQINTAP+iIK0Twp+sadaM4s/4YykoFL3xJynaE/?=
 =?us-ascii?Q?b+GFrqcxNXzf0YG+Ikl/p+Dhtl9Ah9KFDemB9CiyoHIuAJ1mSOumSvZIiPte?=
 =?us-ascii?Q?LbWu3R6Vj7zkzYj1jK7c9PUdNmalTbWJQSvBKpRcFNk75q6sgkI72SGr2ago?=
 =?us-ascii?Q?c/UxYLlF4j994+QhUyVJsfDsye3CFikCsxcSWV6gjh7xEF4dKQr5m/5BDW2l?=
 =?us-ascii?Q?EEnuyr6iWy4KuboOWPyU0t/igi6DOVGwCJgOZhDBo8wINdjof/ZHXPXB0WtD?=
 =?us-ascii?Q?Nil6zB9XgZL41uDnHgtAQ7qwWThqK92ZhCXJlw7kEK9A2no0wRMMqG53/B6C?=
 =?us-ascii?Q?Zjqex8XoI+hr4dM0cUITq8nNfo3wVTWCApWTeONKNwjKC0uuBXGaCQTYbiqM?=
 =?us-ascii?Q?nJWzSw0RSIMtZ13Sa4KPI0o+z1GVAl86kEtC2uLY6IPmBFtOBF61XxbybdfF?=
 =?us-ascii?Q?uQT4nkymOePZZN241NLWQveRsx43NuI7cGVZswdT6SlFOWXDgmM3rElQrk+A?=
 =?us-ascii?Q?0zx2o2Tk/OhsfJ+iDHtbqA9OPX72TTI2qzta5ceaVpRzzEDOPuo2T+e32ccg?=
 =?us-ascii?Q?UQmZsxAQLVXR+Zqyen45BzKKbqxsryu85cZevJSeGrIqCNgU2AX8U/zniwbh?=
 =?us-ascii?Q?66Ty4IFHb63Xsu4jx1zx4ortJIWNfbvr1C7/PoYanIOKjDf8qAbD7l7qO1vf?=
 =?us-ascii?Q?G5yKDQlpxceYML8umJMDd39P+RONhF68ROmw0QM7EACAqzbe0Pf/79GOqTCZ?=
 =?us-ascii?Q?kIvp7leRlzMIITl2t22KqD1omnA0JxDifBSp2/ZDsW8TC0f1FTYNSttKvRn2?=
 =?us-ascii?Q?uKIjyVrs+H2xIeVfEyGySY0DaMt8XPzGiMskf3cixL9P6I5gyk8fYNBNW1x4?=
 =?us-ascii?Q?kfzY58RmgAnS8QSjkLlu4QPyXY48ABLsyg0K8LbcYm9+X4M1hOqig1rKy2j0?=
 =?us-ascii?Q?PQ4a?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 19:28:54.1161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: f68b3c32-23ee-4d55-bbca-08d8b6672211
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnW1zVM3v+8z6V3Dor6JL4Y96BzLJeBUI6Qs6DhI4+F/vjjYph6T29lKyRNgg5t03bY1Pg2vkqlbuABi4D3gmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4424
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

The driver is located in drivers/media/platform/imx-jpeg,
and it applies to the JPEG decoder from i.MX QXP and QM.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f4c94fef4bc6..660b95386629 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12841,6 +12841,14 @@ L:	linux-nfc@lists.01.org (moderated for non-subscribers)
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

