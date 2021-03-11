Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 956603368AE
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 01:31:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhCKAax (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 19:30:53 -0500
Received: from mail-eopbgr60077.outbound.protection.outlook.com ([40.107.6.77]:37762
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229814AbhCKAag (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 19:30:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0K5l0vV2bZKpl1cT+iDRDGVvYHSjtXMyVc6PE7/OkFWWXMR7KSc9pwOK2P0jHw+CNU2YAzLAlvYwpvsanwiLTaaDlOMFPZh2wsYrQFaa9W8ziolLla9L/BxAxkWHDSmoxAzsqoB5vnBxtKhyBeFyLEqaRW3CtUyb3qAefp5QdPRA2CJBfjBZd3iu8qOI3Tzzjq2QFAY5gnQM08yrgS6ejeRiZOYU3cLTjuhBWIX80K2k739teJHK8fS/gF6hgRdFcdPQ1BqG+xc9tZMqLkxetbkBb6nK4tKvdpVyQYLbgfhpGVB0qF64R197Eg4cV9TUWfH9aoGcuBQe0aeNk4/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qc9McbIbkpsgYXk7kKIAhd1jAPp1ezjJhGexdJl0Z1g=;
 b=YbdTJ1geVEvWazcKjc4nATkWdkGpgrJscaO75lCoR/V5VP6cNMZtE5UL3J6ojcUmUUg1J75qRb/FzesCGIhcXHU6U+5Hd7e+uJGnDtKvqF8Dlwj9TP0VxLcnPzR34r2M0tN3z7ZC2x+xksoRv19kEw7p0G0aERoYbYDulhj2lJ1/gETMBlmzfqsADRsqU7EZforkp60NrEgn4HJJTTDSXKxvHcvmhrkdmP3oHkgoCjyXjaUvM/Oi6LaZDmLMp4o6n1yzQ0m1sQaR12XGpPalp57y1XGiy7o6sF7Etxy5xIeNN85dNyLjGwBFQsFUpFGaFyNF+Bmj5dmlFja1VQRMqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qc9McbIbkpsgYXk7kKIAhd1jAPp1ezjJhGexdJl0Z1g=;
 b=HIrt6dTHQxpxi/g2oTm/fX4LebZ6ClaZ6QMb2m9tBhboCcfLCtUiS0sOzNgmF6/rZ1izN+2xZjcJs+f0XQxbrWRa0zqLjVRqQ74UCxwm8hFHtecEvoeSSBewFtWMUYL3UVoXlM/ico+de7/IYqE4zfPoSIjsWKiKH/LeT3ED6JQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AS8PR04MB7959.eurprd04.prod.outlook.com (2603:10a6:20b:289::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Thu, 11 Mar
 2021 00:30:34 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%7]) with mapi id 15.20.3912.029; Thu, 11 Mar 2021
 00:30:34 +0000
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
Subject: [PATCH v9 4/8] media: Quit parsing stream if doesn't start with SOI
Date:   Thu, 11 Mar 2021 02:28:50 +0200
Message-Id: <20210311002854.13687-5-mirela.rabulea@oss.nxp.com>
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
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.30) by VI1P190CA0011.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:2b::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 00:30:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 89495781-2100-4e80-7519-08d8e424e279
X-MS-TrafficTypeDiagnostic: AS8PR04MB7959:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB79596AD5CC3A264713C9EC08CE909@AS8PR04MB7959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uv4TxmG72xr3h7JYFItr2KhwRq/ShIoBwul5It+NuYQpKncQ4w8VwPvHixHwnFyVq+Td18mBZtf5HNf5c93PDN5SHsehYSA22cTRuAP4lXQev8JIWncDlTcdfAN56bdzmmFqKMX+LPXij8lvS6ADfCIgekodxZTFqdiyc9w599uCVef5kawZE2MF1S3TGAK9NjFuCQinSU2GSZlvCw3x+Dntnu+gMxxrkfUR6zhRBLUOZCmEakv7tJ+w8F3SxlQ2a7i5ru4rMvJ95N5TPlDif2A9PI5JFapLgSolCFZ425V8ySU74ulyInWnwiMYPrDZJBF72rfuS84hYzrcMBqj1wl64IzRuHVHHG5YRsrwwwdIv6Dj8ehcrW1FPureT44dh+7oFHDgH3oYjoe6ryuSA9ElH/kRCFE9FzY6nZp9c0syTlv20rNC1zHpgx4hYLrCyYYdlfhUZtlKes5mPKq0PmfCF0U0YnE4D/SoSfZD7hhzWSMH/VM1ptfINzPW1Vdm+ljWNLaMEN0vLsDhYBBCgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(136003)(376002)(366004)(956004)(2616005)(66556008)(66476007)(2906002)(66946007)(1076003)(316002)(7416002)(83380400001)(4326008)(478600001)(52116002)(6486002)(6512007)(186003)(26005)(16526019)(86362001)(6666004)(5660300002)(8676002)(6506007)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?e8esDtbN3Ga0STwKItQeRxLhnk342AhMrncbOgobvhb+Tuo1MphxomJ0rLRA?=
 =?us-ascii?Q?RHyii9dkUlbJqTmffMFX+cLmJQNjmM77YlNqUDxLmnJtWef9qPrnGt2rNuJT?=
 =?us-ascii?Q?sOdjhXhvXYvN8P9hpS2GkYewPl1eJj7Ltf2/bfOZugBMCbE1gKhSGyGMBbxH?=
 =?us-ascii?Q?G7QGzvtVaDKrjVkdYXpiKDHhPh/TCB0Hq2Ez2B1qx5jLLaazJW4h5nMqAeme?=
 =?us-ascii?Q?QKjdqMitFJx6yWvupMxP78rCFaDRTDidYwDPvY6Ihq3MUVM3/HFr3DhC/OpO?=
 =?us-ascii?Q?nM1e0RIVPUpvhN+uPRYhStxXmFq74m3ZD66j1X2Rh5NYhYbmDhaz7pPUmw2F?=
 =?us-ascii?Q?maKbZxZf3uob0cdKHo3DxMI8z97ox5lL9pI81iKQoFp442tWqxY0X+SN7aMk?=
 =?us-ascii?Q?1sA11oAYutLcSZoGPCki9Zd5Rz+fBIygPfhjB2RmFgXoA9XPGex9ejh+Wayl?=
 =?us-ascii?Q?PiM/eQOse7kKE8SwcOGTlFe0fYlKK8e2fRJpH539BQRffcXW+O/TD2Y/rMbu?=
 =?us-ascii?Q?gIqINxg3iQtaACXlmjtRD6J98hv7Ki+FNX5ga3LyOR/CMNXh0AgaengRyB1P?=
 =?us-ascii?Q?IPOrdq8IqxF2m1tr3MrKQ4JrkGUbl5VHJPo2fVm/JTMbb2MD2eCuASdZECRq?=
 =?us-ascii?Q?MZaGUopnbSCHGIjffAPcfS1/dYz4tAGHKbDbguTIMxbJcuaGcMHbw2iqyfAc?=
 =?us-ascii?Q?A6T76nW/zk+g+5OJsqbneLdG6qjCVbI7AiFdV6e558+tWIi5WUMKtgeXbbC3?=
 =?us-ascii?Q?KIOFEhUM1jPFr1A1xN/8ZYCApinEERdUmg7fmh6Q5GvXqm3go6DdkVbRyebL?=
 =?us-ascii?Q?m8EJMLZVHXmmICarP2bdFE4p3KE9W1b+BzanMCdvWLITX1HzGGf4XFF33LV9?=
 =?us-ascii?Q?1Q9nU5xS+nDbsb/9cFK/WUh6aq7jKhwtPzNTHVYftsesGA74VjTaYmmEadqa?=
 =?us-ascii?Q?D7SZOZh401Y0kMlRe5UX2zxPzKVhqur/gDxxWm5aElAFxdGma2hHxZzNJgfu?=
 =?us-ascii?Q?mNMBmhUbvE+HHArdF2xqHi9I7Rft8f4RKaiF0AyGOdgNKDs2VmP6tn9ycZLY?=
 =?us-ascii?Q?nMIDKWaGJBEIURiVATcw9wGDc8RjhaubuPvByQuM8gaIZV7tdMtd20Veg2Ch?=
 =?us-ascii?Q?DTnPQQD58JULyGBJ7JU5V+xLOKlpQTXAkvps6U3VN0CeDGgWBSqivSSYzNs0?=
 =?us-ascii?Q?08F0Mi9cQ8aF1YwTrHGQ7RQ2BnZEHSEo1/nXNhjtfVmB4J7jCKfUkZJcpesz?=
 =?us-ascii?Q?4BU/mx9WmSyhL+iZ+oxnM+JVSVwd6vC4GIGHZSJXayAlrAvq4i4Ib3RKchRO?=
 =?us-ascii?Q?hiMpS+1iJrNlhDwLtFnNUfmM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89495781-2100-4e80-7519-08d8e424e279
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 00:30:34.5519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PIxxSoxyG1R36gVtjpQziKs2oR07IM983XAl+6q5CewFDsVx2xyrVl7Y5RZ2aII7bvNV2t22gCwx3e8wEJHpJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7959
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
index ede40f2a5456..c4c0d6dd4577 100644
--- a/drivers/media/v4l2-core/v4l2-jpeg.c
+++ b/drivers/media/v4l2-core/v4l2-jpeg.c
@@ -503,11 +503,8 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
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

