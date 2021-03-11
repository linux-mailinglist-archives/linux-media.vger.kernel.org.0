Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF6A3368B2
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 01:31:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbhCKAay (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 19:30:54 -0500
Received: from mail-eopbgr60077.outbound.protection.outlook.com ([40.107.6.77]:10624
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229815AbhCKAak (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 19:30:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0xqv1a1+pj1uMov9ICvReKEhCO4j/8XjNP+P+ud6l6VynzvFpMYRvAQ9K0cUOWEjQz/KhojqJ9hDNVt8gpMr9bAhk7Y2qetX7Fm13K7WPRMXG01Y12OXanmzJGs0lvLHQ3U3ff1uQCdj2yWIK+42yu5YieinTZvBY2/CE4RH+f6l9S5XeZEtGk/3Ptwwny4AXRHRXbTjIfbECRcKsGU7uOdt2EGHSNXtbqO8ntpQaQj58S2slcMwOmoAWiSw1LMYmHNUtdnBG5aQ7pSWMJ67LQRQlTrfnRmUIvejRiKuSNN0zuHyIZiGTASOwkeJa6l+51aAHjdNmUqdIvk0TGmXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AYTFC4Tj0/VVvK0DBks/EMmm8RUlJ/d3w/L/yXJ+KY=;
 b=Bvwbmuh7de7rSnRXjXdaXkofcIqE4BR1tdb3jacgfdyUGWLMlDcIPiNAWYsCIbpoLqZbRM/xepRT7a9anMYSCyUkC60rER5jcR3xkwuwl82sQg6P74gB1sUxw6WeZq+cExo9IDbpea470t/D/0gt5FfJyQa5Ivd+iILbKOa518+XwXBg38SrFUoxt02nZYO05aQjyXSlgHFNIGMIXGkk/EbENisgViGY5Dgen44V4hRttF/fT4ieU2Mqa/7NlG4gjwtF4Ub2qHrN5ehAs4ZQ/t+6t0vYXIkvzedMegaWdG/MralD5A0LcKv1WvA0xekC7wCIUvbhb5m+1Mc5pFG82w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AYTFC4Tj0/VVvK0DBks/EMmm8RUlJ/d3w/L/yXJ+KY=;
 b=XHzhKhfd/RKprVSmTs9X4ngJhlpb70VHoXK4oXpWV4S+xDJMjNVcKCUYHeqOhzbrETqgmvlQExJbZJvsBQvI5nwrnvgTTrNO2mJ7kA3R/jHlDqNS3UfDaWIZFQu2P0tyQC+36Aq+lpiCWMb0bpIoiqXxEBRyMJQGQDzVu8bU7vQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AS8PR04MB7959.eurprd04.prod.outlook.com (2603:10a6:20b:289::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Thu, 11 Mar
 2021 00:30:37 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%7]) with mapi id 15.20.3912.029; Thu, 11 Mar 2021
 00:30:37 +0000
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
Subject: [PATCH v9 5/8] media: Avoid parsing quantization and huffman tables
Date:   Thu, 11 Mar 2021 02:28:51 +0200
Message-Id: <20210311002854.13687-6-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210311002854.13687-1-mirela.rabulea@oss.nxp.com>
References: <20210311002854.13687-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: VI1P190CA0011.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::24) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.30) by VI1P190CA0011.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:2b::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 00:30:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 772d5dd7-9254-42f0-e3f9-08d8e424e441
X-MS-TrafficTypeDiagnostic: AS8PR04MB7959:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB79594FB77E10DA1B7919B4B5CE909@AS8PR04MB7959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: clW8+qVDDFtJ7zKuSAKgMeJWoCx+2WExjP4MayhIVe0lmyi0dioRdVWo6iFU56UlDviiskbPSBMdTD2wHFkSn5454PBpp/Wru39uvN9FwY2L+bU1htYQwvjpGPyQJqh6C5oYo3PcEBd0lKMRkP+fRCuXcuWGmtQuMbwmYL9JHds1MtEyU1E0WDaLD1Ht2C+NA80+y4kq32jZbip4QqM1im3W/e3DFMQwN3Q+VvBn/dAM7OjahQthseIAOM+eAMfhMH50tD0+Rf3EBxx2UEY9KzOvFWc9/guBxfBQ39MkkKDayetc/6cYHvQ6T8MnwCsfD8wosJvdhQIOe62nHYjL14PcxHg4jGUVc11HejxiXGJ4TWSRRis3Zg3VkOekKUl7GII6fjm2fg9sDslsWWKuPvBjTNHNCB2MIQd2GgRutzKWiR0GKR6T46ilkGTHFZ8FWzrmCG7z+8EZBAGEw7/N6FVzIOEXngcWmczbxwRBPIuZbGS4tffi+dCZARHH+1HGuHzXTEQauRXAo7/QFyt/VQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(136003)(376002)(366004)(956004)(2616005)(66556008)(66476007)(2906002)(66946007)(1076003)(316002)(7416002)(83380400001)(4326008)(478600001)(52116002)(6486002)(6512007)(186003)(26005)(16526019)(86362001)(6666004)(5660300002)(8676002)(6506007)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Krgchdsz/SW0fX2LQnXey4Tmv3NcRNhvIDjJheUwf48BlP0AeoCJeqJDT/mD?=
 =?us-ascii?Q?HrblkPY563nF5iSG76f93yolEjQABPEwyYVK2HlHQ0Y8h2oQspaspJnTJYFt?=
 =?us-ascii?Q?QWlG/IZUX51zQhm48sSZENcpyGmQFqAMA/YNkkf8lfnVcMC863xEANXmXvMO?=
 =?us-ascii?Q?fXmJgXoszbE9KnYDvHDJLIkJMay6oqmL6RHJNR2E7LklTIqegMCdzPctsN40?=
 =?us-ascii?Q?64jGQALMpz/mEIQKQxngB14qWspTxKZknAfGv6pka65BT9kNbamYou+4lU11?=
 =?us-ascii?Q?gtNP3C01qJlapudYHeeGmPOiEy+uBTH3vmC8Q9aeNhvtnoGF+KQlDO91dTEP?=
 =?us-ascii?Q?QpIdp2d0W8kFVTO+3a1lk7orL8ia1od7V+pCu+2NqUlMRyckI8bCjuhnybRN?=
 =?us-ascii?Q?IR0z8EZ6+CNx6sZbYy2PfO+q7uA1Ul1fkJwDn+IAfZwf2Q1uJCfJCcuchBuJ?=
 =?us-ascii?Q?6eKUqS5+Af0UqOdZbcQugeIKcMTFxYVnf2H9AWkwg3JrDyMeh7owdNaZCxdz?=
 =?us-ascii?Q?LD2N5iQ4YR0S/FY3WagpmJTN4WmmiqVOIqaiY+2HlIr0aTQtx00JnPOiXx85?=
 =?us-ascii?Q?JdGSZQuHl43rO6lycXJO8npDowR0snaitrMDzCxwOmobSUGIPGgScanpMfgT?=
 =?us-ascii?Q?4zoWd8mI71dJ9blcDJ9z01FtdHkovm2wgmeCro6OnPIvnx58c/keaD2z8YPf?=
 =?us-ascii?Q?jWrMvkF/F+qpUGrqFGDxy0RFraJ1LotMrcL8kEVuFVcul5hGvxja6uuZE532?=
 =?us-ascii?Q?FLru/2Xzx9ak/uYVY7GvvmSsxEiCUoreiWlX1QLpJ2aB/8ihDlwJCHstsNRE?=
 =?us-ascii?Q?r16L60VaZBNj8vxGqdFIOmqEHssIZ+DWbZ+cowHZwXeXUj0RfmrDtieV6Aun?=
 =?us-ascii?Q?90sBGNn+GatLmGcbsUIwMIw08SKJ+Ei7O9VlvqxHOfEr+W6nAboN7zyc9Mnb?=
 =?us-ascii?Q?UqFWRBqIRs/H00SHgBf273a0CFpUCTuLIud0BDM6RqIPl6Xdq5bxD4TeQ3Rq?=
 =?us-ascii?Q?OzBvoFklo60CycE+2NDv4KoOyRUAk4ol0YFGwpXyBhhZdh7Ar5L29xUQnrfO?=
 =?us-ascii?Q?GmDPwcpqkKyN67R1WDPkKLx7nWz2RigS4wwo0PDlHOvw6UPjf4cijtBZn7m9?=
 =?us-ascii?Q?/qMNetokSCG4IVgceXVYZG5zltZSqWjooCWgjWExB5MdJZmj9e6LrUwjE7Ef?=
 =?us-ascii?Q?yAl68/i8//vd8PcLY20t8foo/4YL/6DSwe6hW5BZDa//6+pQSTsYzE/uNTjx?=
 =?us-ascii?Q?ruRpXDl40COlGjp/81dy2VXbyBIZMF+RjpN5JsgWSXOBHBQfb3w52OzzIARM?=
 =?us-ascii?Q?Y4wf7CBosdXGFAnSLpVRvYxH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 772d5dd7-9254-42f0-e3f9-08d8e424e441
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 00:30:37.3993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DUE3hn3ExpSGNxqs00Rk33GuRDZ2nhwTGnkgI37V/DAgbAWiij4WA7LpqA1veuAkNvtP9wF6yw9ZLtkCXU0UjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7959
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

These are optional in struct v4l2_jpeg_header, so skip DHT/DQT segment
parsing if huffman_tables/quantization_tables were not requested by user,
to save time.
However, do count them (num_dht/num_dqt).

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/v4l2-core/v4l2-jpeg.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
index c4c0d6dd4577..c2513b775f6a 100644
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

