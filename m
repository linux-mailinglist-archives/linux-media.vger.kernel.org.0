Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F03402684
	for <lists+linux-media@lfdr.de>; Tue,  7 Sep 2021 11:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243618AbhIGJxY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Sep 2021 05:53:24 -0400
Received: from mail-vi1eur05on2069.outbound.protection.outlook.com ([40.107.21.69]:36412
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243223AbhIGJxI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Sep 2021 05:53:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0uLa2RRDwqs5LIzuno7m1RPn3AvyldyntXB2epfTQNxKZBexO6jzaf/CeWPN1Z+1NX/R9j/IvFI9qEzDyHGvu2iPGlNYbDG4fTV2Ijgn9mKxc/72Rtzz0iHQqnKrBjMor9fQYKAY1X7cVrUB/H3Sfq9kNW7rvdW5bihAO3FBYQWWPRzqGtyob2B/27K7syhWxyhKtx1z+KTVQCs7Ol2sgD54qHT0r7flOwNM+3HpQIG+5S17ujBvP8kM0jIe6CkpJoCGj995w2BJJjsEArquVEQLPo2l6O52W7k0DA3Q3BBNm9HyApSkNKUHYTQD7zDU15bkmyNeZF82ePSKIFAkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=C6pkhLLdtqW4u1qnfQrHg3GgbsFuZ6fP41Am6PRTQZw=;
 b=Rz+AKBRzTUJxXmEKA7oNIeaF4Ltwd1MM6LfQ1YSzmblNhl0AFiljoVnPjXrNc+rXGGqpyPWF4MFv95/ocrV2IXC0PlfQc1X3kuftMevaZuDOvTlgGc3T5PSLifY8qJpgihl5kIBvsr78zCHUJ084w3dNApUD+ZWtgt1Z74SZbVCI0lqZvdfi3f/xVOp7T+e0Xsm05Mc0ZJkzGUp7GN+EjFbd9dF28KErWpNPhj32iigkXOyGFNuVIgMJVLtHJdy2rW8FKY9AkcDNnl0zVCXsBiM1PT06Z4Y6W+D/Jmbo7QvTlgH7bK17FJV23NLxLm1enjS1qqC/8kX6Fa0yvWpb1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6pkhLLdtqW4u1qnfQrHg3GgbsFuZ6fP41Am6PRTQZw=;
 b=Liiqe2ssiK/p908Mh+dslsVv/5yUV1gO8Sr3iYxEBc4V4OrvCBQGLEq4qeg1TmThM3g1cw91kpmamtqI0LanUIbQmXdnVCk6nPd0Pz3hjLy1FPZ1yg58ls1Sn6Mka//WmSaeli7/Sm0cQlaKm6hLbGFiyFI/bpB6jSiluobUfe8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM5PR0402MB2772.eurprd04.prod.outlook.com (2603:10a6:203:99::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 09:50:51 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 09:50:51 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 15/15] MAINTAINERS: add AMPHION VPU CODEC V4L2 driver entry
Date:   Tue,  7 Sep 2021 17:49:22 +0800
Message-Id: <485a302f1a0c1027629c331050b1d7cd027275ca.1631002447.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1631002447.git.ming.qian@nxp.com>
References: <cover.1631002447.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0097.apcprd02.prod.outlook.com
 (2603:1096:4:92::13) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR02CA0097.apcprd02.prod.outlook.com (2603:1096:4:92::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 09:50:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6e4b188-a600-4219-e75c-08d971e4fa32
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2772:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0402MB2772E66725C5DA27D045B2EFE7D39@AM5PR0402MB2772.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cjKWM2BiDbQqlELyTtb9v4p3Qt1jyYSYAWrk5H3xFn0mgWG5zDCdYhSN2NSUV2r17tzUlrYtgKKmG4PTBhuG9A3HnYwZyEFEf8qbR8ucY+ufCxWwEp26tZpnFBV7hYOGeakUScHXsZe87UWsWFg6xJ7lrwr/9ftA8UD0LDSsyZi4RoaHPA+cY5B4WMfU1zg6h7UhKWwYsoUEVW0IB1G+GLTOlRuJUS4WvteucKmM+4hqROz15h6EmuM2Vbpi+tMzjB/8I/T/QV1ZsKSKql/jSkdAYIY8VTyvA3njl9j7Wcw0FWM6RfQzEAXXC8iC20G2MVxTaF5hpRHLvYXK6j573qx0RQqS3E/KXOhUOOrSQsbKJbIYK6DAhmq5p2uvQnAyCY19Ucf2qWq2YRfNLhY0pa43sWbFZLajjSrl6xHa2W8rDBdQljHM4+rZd2YFjBpFl/N3uCl0d8Pu1G7TtVfj4sQGpFF694MB+pH7KRYUggY/0V0+2vZaLP7Xg4/2mDVWKdu1InWdnhLAbZr1pcNvAEdUGMiu71MgiS/8JBsrVEGqq6kE9NdMoiTKAydkW81BZH+/y7Rhw+gxW8zVRhu/36lXlL3oA526WskLvSkulaVvnu54dpWqmqw0WbUj1tIyPF+sR/tGgQ6sg1MeeDW/BBXmcuCYmJ6EX69Pf9ZgflETZYoGy8eA0hAdVoyQiWBhxtYP+LEqyoN3R60JOVGICA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(7696005)(52116002)(6666004)(66476007)(66556008)(44832011)(2616005)(86362001)(8676002)(66946007)(4744005)(956004)(26005)(38350700002)(38100700002)(6486002)(4326008)(8936002)(186003)(36756003)(316002)(478600001)(7416002)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s4+hWFFKf+V4CF6HslXO4Y1xgqoOzJZS4a1IpR8Y18biPqWYcdnkxNKPJV+R?=
 =?us-ascii?Q?UBbF55TWrK2pobBFqHbit1ejTh+WZT8eFwkjzu6101vdSjqbBSbwIOYGEYY3?=
 =?us-ascii?Q?KsQQt8KuXqNbeFaoQh2PW3nbAv1Ozgm5u7H+62Cdleacm99WLhFoMo0Bqthn?=
 =?us-ascii?Q?XrapnkDnSxcmpcYU6hqaWz5M1VYy6ZyYeo6DmQEokakg1yIjT3qozJtNNzHx?=
 =?us-ascii?Q?676yskRSDcz1NRyWC9cwzev4AzPJfRg3gcwRWqiytkSErBKGZIaRAqJrA0lz?=
 =?us-ascii?Q?GU6glqDRIfVTFYbxgGvFOBvyvUV+RAJygmIWN3bgj4BVX+yK2KhluVISvpul?=
 =?us-ascii?Q?v0qhMjBus9aTqoyGusmh2ld3rxmbtg/V7WvnIAYV5twf+UEl8qgdV6XXAPZg?=
 =?us-ascii?Q?Z+kZ2PnjD+2XMecelicdEagfgymNGQ1Qyb04cpzmzGOkiBzgjx8kgJXlPZ2c?=
 =?us-ascii?Q?xhj4eg/fBhQwZsl0xvE1iB5VOPRGaFbvyGIMO71Nb+9AXej+QPbb4p2LUIi0?=
 =?us-ascii?Q?qGY94kDzBzWycD5Ff6BiPHavbGLmP8zDXr9I2WHGzYIoqnbFpLEvviSn++6l?=
 =?us-ascii?Q?etZpLLo0No4a9FZFRF4auWkqb6Sn/EEzFD72JDx2wzaOMqeKp8iFF5HZbyGu?=
 =?us-ascii?Q?Gj1bMMIeBFqCk7IHXsl8TSAR01GfjgaHv0pEqg0B/0HbABd0SJqIJ+k258aQ?=
 =?us-ascii?Q?YVqrLzzipDy/Q6diRyV+4sAwGsTsYwTU67D1tMwO0gufoG60NBxWFYcnjb9R?=
 =?us-ascii?Q?iWuu3YqY9xNlFGD1WTil1CFJe0g2UlJKWwCympc4lCALU7CIexdRGL2rmK8j?=
 =?us-ascii?Q?DFPemu5/QoJZW2abXhsOVnaujLv85uShsahxvc22Yg3rSoEVkMrjMxKYo1wj?=
 =?us-ascii?Q?O3LAABRgRV6UAj4dedTRt7ecS8eac4wnjfm1QzpA2ZudMGqttXl+D9DbPVB2?=
 =?us-ascii?Q?QQaPFWOBCnTuQ4J2iDuvTg5plqN/610WS4RJqoDJgMF2yn0Sh1krUlzJiNlN?=
 =?us-ascii?Q?CRyEskxi09U47aZ7jkhnn27p+zg96drpqsJp44ydSwacCfbay2RG1mJrqfYC?=
 =?us-ascii?Q?611XpwIM7wvbS3GtC6JgK7z8FwVbn6n3FIV0u1CL+s+UyR1BpCC7ocGNE2JE?=
 =?us-ascii?Q?IN3/mYEG0WiRgit7uiI3vxJ7Aod3tQ+gTezX/5MkSphnYOoibo6HwIwAH2qy?=
 =?us-ascii?Q?XfS0a2TWvtzXrr2cyQYdm691gVOnWd40pXX6ku4WCF/LHAXvz3XU5lO01yv2?=
 =?us-ascii?Q?r5M+EhbInmLUoWbfozpvVzhuPkqid+xneSzszJssoCX74dmpiS4vaz6x88o5?=
 =?us-ascii?Q?Vyxe41TTCurK5TolurROGACa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e4b188-a600-4219-e75c-08d971e4fa32
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 09:50:51.6676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdL7u8/cjjQGREnGtJq/4GALdkD90G7ZdsCcPsdI4UorB7zH7AjrZ1bWpeMvQixGvo4BDSTkhoXwYcIOAKkFuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2772
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

