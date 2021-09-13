Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2E0B4087E5
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 11:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238677AbhIMJOM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 05:14:12 -0400
Received: from mail-eopbgr50049.outbound.protection.outlook.com ([40.107.5.49]:9218
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238704AbhIMJN6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 05:13:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4+aJKbeqaCt+CNK+BO63gNyL0ejWiJN7x+nZqirqti+4Q218booh9d3/ddrnYf5Y9f3ZTbQEVfQOLeVmQgp/gD8a665Q5C+4/jaQKissHdjwL02YILp32myCa9XBskwiZ4iqxfYKXpwUFYwFZgDJcOe9aOSQnY9XIIxH9kTa/HJE2k0adxW6oqJ1r0/4+bksUm+g4vq6lz5aRYNDZL7KxKVeZNm2UspNgq/DEd8fzKwTDwGJFXcAQP9C7D+XvJ6fs4S/sUW34dXhaObz6NpS34WsWLDwHm+L6wqluaJiTf/+uUyG4y+cVDWiVG9YwEQ0l6pAkZD/jxqpUx4t2mOJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=C6pkhLLdtqW4u1qnfQrHg3GgbsFuZ6fP41Am6PRTQZw=;
 b=CityKcwr6G8mHQlU4/jZqDJGoMVh8vtuN5XiVEHiqKu0EsLCs1HRMYS0k8D57SP7vmB5N+M+UJm3RymLiNhQ/vZaxsHas5afWKNOIQFFB9/JGy0nveifrcNg+2wFS+rNpeJIYKY13275DTZc9zjBUuuXK46ZPK7YMyXn+Bdq2wYGzakUNcHP5/TSpv1gR1A065g/IQJexDmOpubN5zJ3DBedO8FT5BGM7i0Okq5hlYG+tq1O/JP38Q9AY3hnNgIpv4YLXxl1vN2aGD+7ZWghra1K2sDH5RpRwBdP8/v2rfywRgSJqquZshm/ml6qphQYWNICOiFsV8/JZt/hqYoqVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6pkhLLdtqW4u1qnfQrHg3GgbsFuZ6fP41Am6PRTQZw=;
 b=n/5EsqBVONmnkWxmWnAmY74sp8CNMCVry8I487D6iJ2Jio+Dks7qSi8ohZQZY7a5DVGI7mZOwjUaexhkbRF+7PEusmSzny7ExPLYkhjsgaAplOkcIW0POexAOoIdpuyA8DDGVt3E7W2bEEn0nSag26agImzvlvKWw5Cg0U8nmqg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB6134.eurprd04.prod.outlook.com (2603:10a6:20b:b6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Mon, 13 Sep
 2021 09:12:38 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 09:12:38 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 13/13] MAINTAINERS: add AMPHION VPU CODEC V4L2 driver entry
Date:   Mon, 13 Sep 2021 17:11:15 +0800
Message-Id: <760ea9f01d5c4d9fec1bdf784475666390b865d9.1631521295.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1631521295.git.ming.qian@nxp.com>
References: <cover.1631521295.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0101.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::27) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR01CA0101.apcprd01.prod.exchangelabs.com (2603:1096:3:15::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16 via Frontend Transport; Mon, 13 Sep 2021 09:12:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38637a71-5a0f-4821-2bcf-08d97696a1cc
X-MS-TrafficTypeDiagnostic: AM6PR04MB6134:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB6134A349A5E253617870A0C6E7D99@AM6PR04MB6134.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K8c457U7TELX4I4K7gPklWcjANJhzCJNST6PkrMADU/M9JFOQ6GE8RSD+SAj5BNoVjBHoJeghsmyXv6DCBiePtM9q3I4kMqMfJJXJIkQaqmzmRLp+hjH6d1kEuJgSjET2ys1/D07+H56SH+zHvZc98KCWGFiKOyZcLw5f3rkTd4CV81mRxBFvxG6WkTWoqTJfpk+7NxNv4ho9cSFZtTuOYg1/iyUEqYo4y74+y/qsmc6ZhKumigonhIUR0blnkCLV4GI1OEi1USdWkZmH4fcn50DACWhTBa0KqRDSSRL2yN63vfbSXYcQn4MrWemTr2TxmI86M4OvpwV8CxNT2nx97iU3aTDOqF6DvAh0iIZYHek3+6mrOphizY8jlJBrd4IP9r+MmyKsKIa5v12975FKSOr5EDHUrKFCZrc5KBpIuGUxY1G7g32qZN+ZwBh6sWmgicDp1lGqgkJKNnVOuKhC50Nge8N6SPcWuUnedvNTpYAzrlJb2U+/rMk+sI5ylfdeR2b352iPyNJU6kOHCtWE6nNCPZ26sSTC3NoE9wV6C8OoN7UpE+FJ5nSMbHh/IQDByxzkvE7ww0tgJUx2UJbeLQEcChzeRHlKEfZftwg9DajcQrzAfg/nuH0j/wg5GNDu59eS+XcLMvEW5RBUSG378bq0Z9AkWLaszLLkbWu6zXzWjIyRZFXJMvknvPk4lKnVcApuLzyGm2/kX3iY5jseg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(38350700002)(36756003)(7696005)(52116002)(44832011)(86362001)(66476007)(66946007)(2616005)(7416002)(186003)(2906002)(956004)(478600001)(4326008)(8676002)(26005)(8936002)(6486002)(5660300002)(4744005)(66556008)(316002)(38100700002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uzxj+8E0yqHXOHariPwhqLO259qi3YgcA8tMZVaJaMCnpSVlSeNHFIeKt5Sc?=
 =?us-ascii?Q?Xh3NeNL1oK4loBrGbowj6LXvEHsSU9m2yDULRUzOFsAME1oQduvCBrHNqz+U?=
 =?us-ascii?Q?zObAa42TNDJ1UwKS0QdF/xQkB+2KBB719JytUvvpbCXzBg0c8rqQjC1kuAl5?=
 =?us-ascii?Q?iFakJvNvOhbq0biI3WT0QThKmjhae65tmokr920lGccEDUcDbUzqIt9MQxTM?=
 =?us-ascii?Q?yVinCdSkrMvQkVTzkdNAKe8eR45lRmpHiaKiw7Z+dAoZZiyZjE52DhkvOx22?=
 =?us-ascii?Q?INxNs4oTI+j7iQkkujcCqr4MtP2JQhN4uKRQCzDP+ZZ5105nA0xbvnrvnUtN?=
 =?us-ascii?Q?Jj34SW85n55DliAVTrHUAZMlbw6yMw/qCDKE2QayJUn7rWinN5cBZl1o6kuk?=
 =?us-ascii?Q?iD6x/4lfagXw7U0NCQ9Hu5Q01gaUryUOzNs5UvhcsHwTaFXY68HC6Y63tW0R?=
 =?us-ascii?Q?QXhu84SdJN8uC9Ac8unpjphCoqOkOQAVjnnxYrWUMcH8VcLTBz8ks3rSL4Ux?=
 =?us-ascii?Q?UH+a6V+xE2bpbbWRrdqeNWBQQ4HahLlwEzCX6sHzzGWtEuNTAvMhnySXcgyN?=
 =?us-ascii?Q?VahsfhYmbQfEUidaSXNLVh84zUOOT2Fh1UxdpfI91HNSQTAoUG2H2Qna9tgt?=
 =?us-ascii?Q?/fQTixxrdeGF0zaZmsabTPdUQUf7mwaminH6gCJIZE6OjrHcvsQK6P/S5KKs?=
 =?us-ascii?Q?eo+CY39qEZk5tqFloGmxV3fHm7b0rygoV1JGhodTdFod6IgSLbMe4fxvJgod?=
 =?us-ascii?Q?b8uPqjfhFxl40qI3Xg+NylfWrzqcqBNm0AYg2ZIOLekyXhXdoFBzvfUjFnyL?=
 =?us-ascii?Q?8r/UJL+8Duff4ho1QSvaZUQx+RlwLuWJ9mNINMz1LVGtLJOUWHLQeaHWaIvK?=
 =?us-ascii?Q?l6efTrm2Db9IbqEHylLHd7Pcn8uEGMRjAMSqfZnyPMBFA2QrLbMD7NGCT4Ko?=
 =?us-ascii?Q?VoQ99xXh21ufGbbL0q0MAqcRnRXRwrzLlriYo8Fh4F5EtrYnQ+WStbf/BNI+?=
 =?us-ascii?Q?V4kl5n8qaXgWsNwg6p+ydTX0ZX9idqXY4tT0+wwSnhjcKId7PasJ6bh6MWqa?=
 =?us-ascii?Q?RetLj/Z1T1HOGKboT1Gh8Q2uGahjAB+e4OznnfzGqBC7K5XmnGlyxYzYasW9?=
 =?us-ascii?Q?8W9SGTKXE03aspTGcH7UCCzBnFxwWGHMftqsBhG5G4i9Cx1oOeKLkYTWlUAm?=
 =?us-ascii?Q?g7I0Nh9H2w6ZJq8Wptq1UmboDxDgybUy/WWkFxYfj/8a7ODTw41VDOd12rkW?=
 =?us-ascii?Q?7mU2l+/FS43QX3us5O/Kca55cfi1XmTWXtvZ0hUVqoYgo504Vg0mqKjLGp4e?=
 =?us-ascii?Q?mk8vlT5r9t0SyPORy1yRbXcB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38637a71-5a0f-4821-2bcf-08d97696a1cc
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 09:12:38.4688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXMqt7dFqqeloA7sHzoqjTZo0i/wofeSv/NShsQtiiOeKOW+S+g7hTa9ALFenG62Gg+CG55eV3ZURBAzpUlr0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6134
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
index 524eabe50d79..757272bb8395 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13416,6 +13416,15 @@ S:	Maintained
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
2.32.0

