Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C64284D2081
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 19:49:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349636AbiCHSuU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 13:50:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231259AbiCHSuM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 13:50:12 -0500
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50046.outbound.protection.outlook.com [40.107.5.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61F2B532F0;
        Tue,  8 Mar 2022 10:49:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LoF1NEik887jJP8qTuJ+RsvKVENe2TPJ58M4CsBbs2NqOLt9NBWTJW8BXBICqPNmigbMle0uNwragKF9/Sd7cId7azCy8/dYSSYFFJBkBEfriZxbymDc9a+6K9SS7+iOyQu9aj59irpspCUjv/USORtQXacQL4Vbm8MF23OytTLv720ktUAxs21+c1xWtNoCahQZ5NO/c8AnBT0KmYEUZnaeoOeiclCC1AAmmBQUDo5f7WvapChjKzr6FtP4WD8yXtA6d1ntbOWoF1B+DEtLjtpx8hLriCFxLu/DDh4myc/c7Z3tOv/ziRaropRQeVUbRU76iQL46tKSj5aRRtsd2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwgtUp97KoqLMQmUkZYRjZ62EDPsDW7BtudCOG6x1Bs=;
 b=PTsSwDmgZ2yMi3MVn6We1ccfu8Y8lDZCqhxZHMkTG+OvTHfayzCXs7/RvIY4yg43/pAXVwkVVCuXzUJpf8KU5qmUVgQUIjPDriIPfKmptwNmnBzJCGpME5krZFET6z3ilnXOnmr8eKwE8FCLc/Hlib2z6R/ISZQxk74pvOZAxOi0+VUkpq9ZUAZWOn60tTepW2yrXqEI2S9nWZo7Za/Fs6A90ScTP+KTphVtSyTQPLL7kUluTpeFXXH9SUM4RQXAQIaspG7yr3xozdK4nbUae4H+fwm0cCK1ggMxoUu3GEmcWCU4SHLJFIuOorNVnCyvIa7ozJwBG8L1Dgi98KCVMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwgtUp97KoqLMQmUkZYRjZ62EDPsDW7BtudCOG6x1Bs=;
 b=ODHu3sb8YGRUv4rSSrkDcvM09VHm9tXAm++hShFE61Yjisr6ljdFxI5f7UnxKrgd4dUL3AxveHJRHwRoEUmx79Pg+x1Kw9t5pIVIKnutY6/MwuIf/s6Ldkq9W5HQlGXrWp9dEsqdwryuPpw0rFskNhrMs/tqWKW9XHlDZWMVeB8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM6PR04MB4311.eurprd04.prod.outlook.com (2603:10a6:209:40::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Tue, 8 Mar
 2022 18:49:07 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 18:49:07 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 9/9] media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver
Date:   Tue,  8 Mar 2022 19:48:29 +0100
Message-Id: <20220308184829.38242-10-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308184829.38242-1-xavier.roumegue@oss.nxp.com>
References: <20220308184829.38242-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0131.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::23) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 721d7b26-07cc-40f5-193f-08da013452fb
X-MS-TrafficTypeDiagnostic: AM6PR04MB4311:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB43113DC85E58C83C780FD981BA099@AM6PR04MB4311.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zH72vfhgQ3WKc06k4bV1unrLJH4PEi49zV1SJf8sdclshytZU9KNA0EvfqVHFy+l2ZDJ/+PhWAv1xT+WUIZQn5I1Yh4VX1B4vEyPBXJl7s51CpJcZ1H5yLdR+40qpqwqPhQarEN6QIuYQgZ3sUB4Vdqt6fLAGE/DdsEN4LZI0wvtxWcgddn9FP0BdFkSDR0mTzUCHj3d+24wOvR6zw2zEB1Z0wziiySC6QxXj+yBeKre65URLjKz8/A3CdjBMx1JYZpT9t3iLA5un+A12nZX/Cb7xa0nHfNxT6hFrrcl7u7KaD5XUPXOvjmx5fyH2JeTs3GtPQBmyARQ2WIpQ4AX4zVPr7N8iCUob22liNH4aYiSHVu7yTleJbwkdCe0Qm6SDycpHpulhJ2M8bG32whxnYjuP2jUFQqMsfb8Nm/sER71wyHI4IPnykjKuBiVS6JXl+gv+0nWB7cQLVbptB/ZVR7ZTDwVHpLit/mQzL7EOOH7B03GNUV023GwmNBy5IButK96FgSOWUkXUIzSCD4IWQXz9HhldjGTxAGYpOO0DafH9T1HQFe9QMHwlorw7AtLvxGxNtO/Im2Xoi0U77E7xkYKGAL0FyatEGx73ZDjKKU/9oxkFk2U0DaOI/YDZ9OFizjvu0RJY+juD2oPadPnbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66476007)(4326008)(186003)(1076003)(6486002)(86362001)(5660300002)(8676002)(66556008)(38100700002)(2906002)(44832011)(4744005)(498600001)(8936002)(6512007)(52116002)(6666004)(6506007)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jx21UEJBNq6T97R55MaW4+RY05MMqSv2LwhIr3nkSOG7mVbZ/18/khrIdtQI?=
 =?us-ascii?Q?EHawVaC+PujjFTNxZ9eiBm+gCn2ALFlZ/mlpqtak5WW7U3HA1sTS0KqJ/BXW?=
 =?us-ascii?Q?Sjv39JKvlMPUi958hwGiQJLJSGW6tnZTVPKj1ivwv1Zw/pvuFKUhtHuIxubF?=
 =?us-ascii?Q?aVsbpaeT4OVvbayeZkkuKiGR9v2s96okV4Hrv3hicXTvRIouaqhBkFyqAbG0?=
 =?us-ascii?Q?CfVYZyfhvKZClweBz2QoW5bfnsfDE6Fd2jsAiC0uTJDmwbbIpohOjRzwPfHY?=
 =?us-ascii?Q?KV4WU5stTHeNh/nCBvVkFy00Sjwqxaq9mCRNNDRXBcbjsh6gnm/LG/hZORcZ?=
 =?us-ascii?Q?Aaoj/KwVE3D3fZ3hRScAwb3OfCiJzIR9F4l6FkJpkGSqR3W/Al4+hdVV+9To?=
 =?us-ascii?Q?BXsEkT6QiItC71m/arWfkxYh7wTq1XvSKp9NKjum6AJLL7omgkKc0EJf/pfu?=
 =?us-ascii?Q?Y9VFeuu9vtH5MG1wxfTl92hSKoJsAKHYwWSLWQWM50F5URkRg9xu2bJk1rSi?=
 =?us-ascii?Q?M3ib5VdGKbY7Xz2fU2luqUlyDr67WUmBuXP0eEcyNTqweLHr7OS1YzK2hHPD?=
 =?us-ascii?Q?ANOLQp2CivQAwWV6DesWAq6avW8aPpkY/NGE4luBTbzinIA/TOCnjYSstu64?=
 =?us-ascii?Q?m/L4lth/rZ12MWN+2T/rPk3SJXVmUWUCphdcEw6GCuOzcSPQd+WEfwLl4p0+?=
 =?us-ascii?Q?2ViB5aWjkMwQ4wYM4v8xG320DdMPZEK1Ryepcq+GFkMuPsu0p7rF5AtcN4Ai?=
 =?us-ascii?Q?UyfVP7Bm2bEW1ljEABgsyTUz3+yrFYZ5KxQ3vuxr5PpepRLuuf77Vpqa4faL?=
 =?us-ascii?Q?0PTsGkUfmec/Cj1XRMFPrrzbpM4dw8YCctQkgnMyR3NiXYX7JIJCG5P1zw+e?=
 =?us-ascii?Q?ZMhy8lrwRroNdP+V+YEGbKjusgX4YdW22weeuU5Zgz9bmRzE55i9SS/kWJZv?=
 =?us-ascii?Q?5ASyuicHZA3tV7WILqTHTAyM72eYsfAMFYsVoBlVXP9UEHchRJMAKdvEFXkA?=
 =?us-ascii?Q?Sll1KApueQFlxYUEXiNDaXVTPVpQkxGXSwWbCqkulxVg1c0D/dqyqCleVXQF?=
 =?us-ascii?Q?W2pnNpDkGTj7rdoxYc6gy4iuYJ/+pjQZzeEOjjQFraCCDxXdwju6vpQOdrie?=
 =?us-ascii?Q?cRthnsucc03kIh//jMfvom/eqrmdJexDZpFs9Z8/HY1cBXsSHpym1v5Zksul?=
 =?us-ascii?Q?ieODsLG7Q6qHGnJ3AJg+DZgSagXkNIwo7yIscPwIxOI0eAd9vJDNtPSyyHc1?=
 =?us-ascii?Q?QdAulvoVZ6qtZytcIPA+Pd2d8GeR+KKi6InDQSvnRHMXZj4OtvuRrDf3y3vx?=
 =?us-ascii?Q?gSOfUhylxwsOI+o+inaS2cYUcPwfWHpzlqz/2ZU2l6uhDvX6udEH0s4AYFqk?=
 =?us-ascii?Q?Df1rB7yiIE7ZRHlXqwzQbMQ9A8vMHLbRIDeVQA3eGb23DKjqUjinFs4UdKWW?=
 =?us-ascii?Q?ZXl7tbnCRnSSOe2HOxIkeR//g5AK+oTtSDwTGfM1Yop4MKH3ZRHGttf6ZVGT?=
 =?us-ascii?Q?vC6QbLLNWLUlEhrcpJDOcTXRKt987WiT2mR1xQqJg91WRbLYE1XL1Aamymq2?=
 =?us-ascii?Q?d5IKrfeXZJPREF3dWvYJVn4mym3DfScgK969JIOX0ryWUMefeBfEXZ7SaTxa?=
 =?us-ascii?Q?zFeTaZKy0ka1mOJF3JVpWVphZxN8jEeqhHL+n38yWtZbIICfUnBMK3em5/4c?=
 =?us-ascii?Q?p4cizUaNvb+/unaLN7wHRIi0/Y4=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 721d7b26-07cc-40f5-193f-08da013452fb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 18:49:07.0023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /tA8cNBBjLh625iL5uz+H18mKP8adRHFsklV1chodAZKB67202aevYG0bDtf0Y1OLHQ+f0S4bFDagI3kSsr00w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4311
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ae55cd558d95..8ef3eb0620ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13940,6 +13940,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
 F:	drivers/media/platform/imx-jpeg
 
+NXP i.MX 8MP DW100 V4L2 DRIVER
+M:	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/nxp,dw100.yaml
+F:	Documentation/userspace-api/media/drivers/dw100.rst
+F:	drivers/media/platform/dw100
+F:	include/uapi/linux/dw100.h
+
 NZXT-KRAKEN2 HARDWARE MONITORING DRIVER
 M:	Jonas Malaco <jonas@protocubo.io>
 L:	linux-hwmon@vger.kernel.org
-- 
2.35.1

