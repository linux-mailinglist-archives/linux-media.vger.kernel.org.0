Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0257C42EC2F
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 10:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236502AbhJOI1n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 04:27:43 -0400
Received: from mail-eopbgr50044.outbound.protection.outlook.com ([40.107.5.44]:29391
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235145AbhJOI0U (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 04:26:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZ2luKfP58Xag9IpPAi9nNDB2n8Zb5sVN0yp3XqulLAPAcN1azvHa5WruMFjDv+YyeHygDPBLMVDvgiZNsdv7zYpLy0ZwbsAeKQ44vmz7ZZHVPBEJDxIaASCzua/t772/0Y0ROQfaB3F5f3issnhWBh+RCTCrmQ7hp6cFmuYSGTWLH2McTI0jI2IYLqM+MyiH/nfQpKlg+4Tqx70ry3598C7H/fpE/f2TW572U3Ax5g+AsQ3gNm32YReSZ7URZM+tswNmKpUV+LLtyysjF+DUZh0Mw87ILApluKADO5/ghMXBofV3YKuXPjh7lm5IXGbQyb96PPJxSuuDut+HybZ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7mS6O1b1O0KcJd6h45R8QJeIAHXl3SnWsN2qGrDDEA=;
 b=MFRnCT0q4OaBkPYznmtvd5CFzJ/4L4AMKuSTcdb6LYeKxuuAWSfXqUrw+02UbpQfu2jw8WqzUTf/jzGnbx7s2polcZFRu87ZvcX1V79ggwgf0d2JtY6xUUQc1+PTPF4mplx9GK9hvLBF26XIi/Omy2E9iw3BFcAKFdeF1rWSX5P2prBgk3s0BpGTSwGbytP8zrA4tdX+Z/07Jl8M7aHKk/48NUve9HG9ViG14nR1w+0Y1AirDpOqUklF6hl0QNBuC1NisSXF1soLhOUp4Hf8U7Ds//t4ilEtPRbiXzWcZaJP9jZooAC9imSWcNFBE0ISjXmjcEhTtjDusCLeyQyrkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7mS6O1b1O0KcJd6h45R8QJeIAHXl3SnWsN2qGrDDEA=;
 b=chhpnJIK++MtVO0mhaBIlv70q9Z5aNh/JmvrMKcBJCFIHH8KnAGNE6gA0dDNzR7nZOC5kzpM8X1fKqv1x8CEJi7Ffk3i0jBcf0rKATprqoJZzLr42YL8nNCPqDUKNZ7t8oTEBdshIlgNc86uwv6hTD8MTaNrrCkkPz+A+vgPvPI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR0402MB3591.eurprd04.prod.outlook.com (2603:10a6:209:8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Fri, 15 Oct
 2021 08:23:43 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4587.026; Fri, 15 Oct 2021
 08:23:43 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v11 13/13] MAINTAINERS: add AMPHION VPU CODEC V4L2 driver entry
Date:   Fri, 15 Oct 2021 16:22:02 +0800
Message-Id: <f184c893eb6e1800ff9ed0785f65313bafc81ff0.1634282966.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1634282966.git.ming.qian@nxp.com>
References: <cover.1634282966.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:194::13) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SI2PR02CA0003.apcprd02.prod.outlook.com (2603:1096:4:194::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 08:23:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a67c654f-debf-4b4b-c5b0-08d98fb51978
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3591:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3591722C25724BF8716F3776E7B99@AM6PR0402MB3591.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f3uNeaa/ZmIt0ea2bSSQn299GtkiT3gP0B5wZMZUoMTysFmSvJkwSe/ByvC7LHeZKt1tyQWD23Uk4dlrrBGmyW97+L4kKsUEVJVmR2bHfsulnjxB2TYi28EnrS2dLeoImkamk7tdigciStpHBDPsSfysCJWnnqvjR6uPQ8Ny6nuobT205Vagh+tUDhiufaBIWoo+bXyljHECfWHFYOs7MNJzLxi1Ih7umPPlE4Zc/nMUxI0Rzqz8tBfi6XZJeDIOiPfKtD1HVtJSmcRTJK1nRUVIWiO1fHTdnHBAcAPYsGo0WLa+f7nZ3ZeFcolFPrViAQRYmGwtrsGL+4bgnlkhGfAYvImY56cs9xkZMwA/L8V1+11oGvrKxT8G/OSsm+XGbZ8KD4Ck7+45udXBNr6go3es7zM6drYV9kUokTmIQGYyyqib7RZAQhAy3nxfpKjEAWh7e8vGWhHZ+/eZdm3Wnj+P6o1el34zwMrmt2BzYxBC2L2Z2f/pGQgEHCn5A6O5vYrXk6Jeg7bBliLReb0YZmN3WyyBRddtVhjsSOfBEhLOf2s9Vj1TmdgsSGz3Xusbwd6ps6dSJzXXfcy41SPXSy3K4kOGB68s8N4GXDEnOaVGM3zrixmzM5mUJWlJ/v3kg/GlP5EYkktMzBpckOtDHs2ydXEySZ37q4AisONneLlkuXh6zagpcQKasn2X2t2a/4ikLQXyq23RgVsDyH/WrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(66556008)(8936002)(956004)(4744005)(8676002)(316002)(508600001)(26005)(6486002)(186003)(4326008)(7416002)(2906002)(6666004)(52116002)(7696005)(2616005)(66946007)(5660300002)(66476007)(38100700002)(36756003)(38350700002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VaIeZx4jyT85c5O1RhtsT8tEbT03k8fe2polERNmuIIXzilkHifbWpIPiGwK?=
 =?us-ascii?Q?Oo1aGV/HDxGzxIHpnlsqCIY6Ls6qwe6nv8ulRK4tZSWXOCASGUWZ4rHED8qq?=
 =?us-ascii?Q?BPkgWg+46ZRJc5z4/jtNXdYVixf4uCWwB3B0KKGT1tJ3KEO7wdL7coiVYFN1?=
 =?us-ascii?Q?3cvvSeZIWmFljv6/00QmwO85Ead3zUsvbUfrJMbwhF1R+4ItEQrxoecIENJF?=
 =?us-ascii?Q?7mavlwqQHqup3ZeeUYFOm/VnPNUXcogYjDeQYk9UFMJ/8WTl98NyiDZ6haCK?=
 =?us-ascii?Q?9F1NevW7+owSHb2SQd6xCoDjtbb0t/9LsNI6DoEau45hz/vS8uTChhlk0abH?=
 =?us-ascii?Q?3j5uD24i5PguKLjnxoH29kx7nG/R7fsOP8UWO8nFGc7oM04xmk9gRgairthJ?=
 =?us-ascii?Q?KOJc24Q/gpm9EPp+VpMw36DZngdQzlUQUbJaUZt3xozoLmPmfqLGdnJLhexi?=
 =?us-ascii?Q?B6PkhR+VftsjnBTVpwkT6+e1Y0waIWJj6N9zUOVjJtwvtmX3b+GsoxWcCmsu?=
 =?us-ascii?Q?AiZN1s/dEfxFqq7kjIsGmIE1aVGJrgQSssYLBkkAGQjteesYvU5ah9EM8UL1?=
 =?us-ascii?Q?LGOFoFNhWb/38EXUlx09jJMegWeCn6EbUlmdH2YNS+kKlyGAEM5++zzAaOgh?=
 =?us-ascii?Q?P1AIxXCKvIQZlNRKGGwmoO5BC47vP2tzxJp6liXfXrbmhZrEyN1j/2h8lRSA?=
 =?us-ascii?Q?SVl7sEW9om2QgF6exyeX/Q2HquxJ9udFLa/VyzfU5sd2VLLhbyPRqMctq8Zv?=
 =?us-ascii?Q?yQU5ckYmd89dzGK+Pz8bdB/RLSg3k7lYEe20aTWdEjvZj88GB8v1rUa2o3mm?=
 =?us-ascii?Q?Ea5eqy8LAOyQjlhJH3BN8cduABq1qb5cpDLyQNQ7ugkE5MgjRoNdyTwXu689?=
 =?us-ascii?Q?SKP6BWvnNKH/fqaoxMgeWIeEUfOuAwtX50AhHtcwY43z7BMPNmuZDG6+XsX0?=
 =?us-ascii?Q?RRLk90ZLOS9vkdl8mAMVyb+x3BwkL3Ba6DBjZXdzSHZdA7E+SVCJk7gelVgn?=
 =?us-ascii?Q?17QzH1FZ0B+7uBj+X/Y83BU+665s76muKkqmlHISFSdfn+Mf+bUr3TZiFd8c?=
 =?us-ascii?Q?+aNcU/mUYRBSprOPdGnlRXZ6eNbnJ4GhAbJSEh1JsM7l+gvsc0sm7cOLZnVz?=
 =?us-ascii?Q?pBW5UUByMtuTLY3nX9ppeyNB9QhHEykM/wRIyAPh7EWI+3/aIuax6d2itS64?=
 =?us-ascii?Q?s/vuMNyy/pX/0T+pG6U0H8zyqUsBQXRruDTQGHKnacD6QA7MDwGry4iTM7rN?=
 =?us-ascii?Q?QAiJvWifOd5i27JAN4/PLEwB5sNqBd6fpIWBalDLaGCraYhvYSUHGdXP3iph?=
 =?us-ascii?Q?Nf73RqqSapI54I/daCpLl71t?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a67c654f-debf-4b4b-c5b0-08d98fb51978
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 08:23:43.1961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSzrJjZvCEVd/Mqw4J8e+fsK0fWebVM84KzLlsz26EQRE1Arj7ZGqVzFOGD8AKr7atluR1BN8T8EvlO4btiokQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3591
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add AMPHION VPU CODEC v4l2 driver entry

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ee91c5472bc1..f35b746cb46c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13533,6 +13533,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/imx8-jpeg.yaml
 F:	drivers/media/platform/imx-jpeg
 
+AMPHION VPU CODEC V4L2 DRIVER
+M:	Ming Qian <ming.qian@nxp.com>
+M:	Shijie Qin <shijie.qin@nxp.com>
+M:	Zhou Peng <eagle.zhou@nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/amphion,vpu.yaml
+F:	drivers/media/platform/amphion/
+
 NZXT-KRAKEN2 HARDWARE MONITORING DRIVER
 M:	Jonas Malaco <jonas@protocubo.io>
 L:	linux-hwmon@vger.kernel.org
-- 
2.33.0

