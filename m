Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 066DC3FC113
	for <lists+linux-media@lfdr.de>; Tue, 31 Aug 2021 05:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239515AbhHaDCc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 23:02:32 -0400
Received: from mail-am6eur05on2073.outbound.protection.outlook.com ([40.107.22.73]:13472
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239690AbhHaDBy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 23:01:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLFlE2iMbTCbbBblcRt/ClgeoKqeMO2BMO4q6iUMOU5i4aU9g0iE0DL3887+hS3Ho3waMQiWyygq1EGOcb49DQaIOOY5RfoYwp2dL7BaXC9DqX5PtGn3tkzCLP7RIyDkf/Q5wa4xk4AvNGU2phA/fQqA3YmdjV8jFGZeAABKHW5mdK+4cRZH00HAimyfCWFCw2IytV89fCF/KHQFSwr3Ac3MILGjArrw24mJKP1x79HoXEj5siRnNnVPkwdwHkNF2zUIYCnoYWZnWEv+/HczCZCHxY157njrvt1OyFH62vKx65XuKbSrlg2Bo4B3h9ANJ470KNZFotq0pvtwUHQZHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIxbb9rEHNY5D28FLfrsP7F6i+sjxtTYatIyhaTEdKY=;
 b=SzMlabC9NhGQ/bcT4MXm++pTNvOjKoxVLMTA3xqT0NO5gcAdekBoegU+h+SCh/Rjc8D1zCTBGSdukCDcQeeTFlMgYdY2nBjEDHyZwRPfSaTRau1zb8gz57P8paiZtqm1xpkNi5YzY9hypbQ5bdU8hdJ7tvnt+2fyDp3r1EIO0msDpgtYdcjq90sNQKzzeKsDPr+Gq8P2YdYMpjYN94JGAvQVKOPe+DUnT1NS29y7TRL4gqFRduNOeVFsZuq+2eqeLB3lXrpbikoTqrLDGIc2JE3kjcbjmhuSBxoZbEM0WuRQYMkh+liQlmhICjwD2HZfo2w69IV1hI0MHSCIEkDuBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIxbb9rEHNY5D28FLfrsP7F6i+sjxtTYatIyhaTEdKY=;
 b=WOBtpDZRNrYmIC4RGcsdu3RLOlo4TPDW65+ZDzIs72Kh9sZNBWbd5N2TbXEN5JQVs5M+0FfJ4cApSOX8ogPhK6eidtYU/rWXFntORXjmTK4rUbHxB+R2rDPpDjzYTEIjIGcI98KaNiG7C89EZr6MInrsaq4htOePb+s4wwp/ELI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB6134.eurprd04.prod.outlook.com (2603:10a6:20b:b6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Tue, 31 Aug
 2021 03:00:56 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 03:00:56 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 14/14] MAINTAINERS: add NXP IMX8Q VPU CODEC V4L2 driver entry
Date:   Tue, 31 Aug 2021 10:59:15 +0800
Message-Id: <722cbe52af7ff428801552eb640e9093c1725b51.1630377507.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1630377507.git.ming.qian@nxp.com>
References: <cover.1630377507.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19 via Frontend Transport; Tue, 31 Aug 2021 03:00:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36ae027c-c6fb-4366-6ddf-08d96c2b8d90
X-MS-TrafficTypeDiagnostic: AM6PR04MB6134:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB61343C4447B8ECAAE7A6181EE7CC9@AM6PR04MB6134.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y/rlYcN4hbzwlsp4Vfa9eidhm8p0EhjFjehdsCp/2n/0J1Xs0em6wn8vUSZtCiLVz3qpisFVTlv4rumZjVedXeYBQTaMQXLSW5V64sX7/mfbrv+3jGg3njkr6upets/e8D6fKD9RebYmcr2hDDKeDwpxTVzEuueH+o6bKAiCJEJmIOwL+2wBxyxmrTGn0hK+1yLKg2disG6x+OHS5ILz6HaIWC3U8J89gkx5KJkLZrp2U0U67CXWGs1MfwG4A+W206991LW0dkpbMchJ0KJ/iQWhw1I8q4Ex3tlUWhbYK7FVJHRbjRwroXhKKtd3AOfOFEZ9U94BrDHkwWPceB84zt5zV8kn+HcWQ2pn87LUKnm9h3jXs/lI79625iQ0qNSAwIk3SmfDofN/9mLYiWuKZe4uFvPZllJJSEf3atAT5RAbFbmCorLHHFPzUuKhU2etFaWWcGjLdzq83Wz8hm8dIAGjCfki2CF7TUA7I1ZFhVRQIhiPP77GeQBWc6BfOHzlXl2gI2naBLahZCnLY7o60Q75Ura8FXhHGCf6Cvm9fJm3/cOFqUOJK8mx0nxkd00bCuYum/awUW4ngoNsErpCasMjnTGETe8NGIctWHoX0NCYt14H3PFzNLNfdm3dwp3qZVHHM6q2PhXNLTQAUhfrXYCP5Zwbo8s/Deb/TvFFKXr/Se3nAfvo3heCF0QdIDHFk8VU0qbBt0dqEeqUcQGdSKqFreF/dxCAEDjSg8N5pPc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(5660300002)(8936002)(7416002)(44832011)(186003)(478600001)(4744005)(52116002)(4326008)(2906002)(26005)(38350700002)(6666004)(956004)(38100700002)(36756003)(6486002)(316002)(8676002)(86362001)(7696005)(66556008)(66946007)(2616005)(66476007)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1BX5+CNSyBbKPguxuDEI5CGBqvOML3zbhgShxxh+gxdWGrpdPwdQPHzhtxqi?=
 =?us-ascii?Q?KbSWRXLjgfWQzav2xbz0cyHjUC/57fSDH1b9xSZDnnIIBZ113nb+Llmb0+KM?=
 =?us-ascii?Q?K2LB+aP0b+S7l7OIoSeKg8/c/gmP5fYv/QQE7lr8ZSqfOKS5TGaCg8U672b6?=
 =?us-ascii?Q?NjY9dFey0rM6TTdHDL987k/1lmP6NzsoFOnE489hvs+cxvrmZiNwusP2Ms2f?=
 =?us-ascii?Q?cgu4sFX/gtNTYIFzfUnkaRe+mEGX8wLv8dKODC2LMYVrJSOlvpacIbeAHf6a?=
 =?us-ascii?Q?j0LXzflhj+CmZOR4FSzjcKro4LrgVxnkigL1QcFB4hqog9MkrmjMdM64lA/T?=
 =?us-ascii?Q?4e2NH+WDQDni/X720YrdT8ZNLAvmXJbgl0UEz2zf6T8QYvIxX6OZHuMjpUde?=
 =?us-ascii?Q?Q6cZI0sFimw8yXeH5FM0Z9peSmc2TjoKHUdvCEOy6xWHdjvMQ7GRA1lybuKu?=
 =?us-ascii?Q?M6rnsfqBfNosc5WVMfJZzczh5fXYMc8runj1BDCg712Qh5yh134N3yPPDPfo?=
 =?us-ascii?Q?tY3e+cGZcp8t9dvPFAdGLSahQ+k8Uffz2PpbX+m+K3PTW2QVxGxhu5vBm5A1?=
 =?us-ascii?Q?vywkK3VncU+kckdHNtaEE3HEuK6q9KLwjMtX4WjLYpE57LcPybe9htVcVf7t?=
 =?us-ascii?Q?yefgc56d+xSPK8BKsnKK7IhrsStWixKBCIdD2U0SaaAXjV3nBH/YSnFDL3s/?=
 =?us-ascii?Q?sXkLP0rX+hV97Y8nS8355DMExmnD/mcqcNFoxRymTEwAVPYeQ/WbxGIfzODp?=
 =?us-ascii?Q?ggnuVA9DD5s5WK5Sseg/NG4+NADfjGm4nBAPZJgEV47jJKGGlJr8Wnr0Mfw5?=
 =?us-ascii?Q?R3EjCZgJuBMFxDZ8z5H4e4cu+nzgmr6nhVeJ/UP895qOVWRUWXIEgDhrtP79?=
 =?us-ascii?Q?dPFi9qo0UL1F+Nal8lsT7rIH0OWjH/jEg/mosxKIREr8Bq7ld4vMEvpBzRlw?=
 =?us-ascii?Q?aBcBJyBOG2VKbcsvA/097iUvFtBHYElT+6TJcm2xJDhCHxZng3VLaxKuAlPG?=
 =?us-ascii?Q?Bcx23I8OElzgw7kt+dRV+ZteXObWDO+uU3qhasGREPhKP/vof51VoMvQOCPX?=
 =?us-ascii?Q?szLMQEgqIY2FpKVqOPSlT2JUd1fOH2oIYz2S4jqvwBnyMIJFZuB3bkSdKlLg?=
 =?us-ascii?Q?VMkwrk5Y5HKbkyRDEQ2JPTW6aZF4f7YoSs4jvmdY8RQSnhe2l3OOjQ4PPQFT?=
 =?us-ascii?Q?PpplEZd9arTBgt6sDxHHI5jJhqOWB43X1RHF2iy+dFng2gmR3w5jzXVtjdWt?=
 =?us-ascii?Q?zu79AjlUjx0tDg9lgbKveIWlgnMhxHTZQ0N3SsuhSXj8YF8FdZPzmE+kg+kK?=
 =?us-ascii?Q?2dOmGUxPjazneJIJy7666CTB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36ae027c-c6fb-4366-6ddf-08d96c2b8d90
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 03:00:56.6860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3KiyVylbeYzym49fEdhj3nYlUaUnCR/Jznr3HepyGL1AUtihpkRzUsHtHhl2PR1CY/6a6+5NIxqoenCXcIVjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6134
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add NXP IMX8Q VPU CODEC v4l2 driver entry

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 524eabe50d79..77d30a55983a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13416,6 +13416,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/imx8-jpeg.yaml
 F:	drivers/media/platform/imx-jpeg
 
+NXP i.MX 8QXP/8QM VPU CODEC V4L2 DRIVER
+M:	Ming Qian <ming.qian@nxp.com>
+M:	Shijie Qin <shijie.qin@nxp.com>
+M:	Zhou Peng <eagle.zhou@nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
+F:	drivers/media/platform/imx/vpu-8q/
+F:	include/uapi/linux/imx_vpu.h
+
 NZXT-KRAKEN2 HARDWARE MONITORING DRIVER
 M:	Jonas Malaco <jonas@protocubo.io>
 L:	linux-hwmon@vger.kernel.org
-- 
2.32.0

