Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8CB14E991A
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 16:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240087AbiC1OPy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 10:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243698AbiC1OPs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 10:15:48 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140051.outbound.protection.outlook.com [40.107.14.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B8023176;
        Mon, 28 Mar 2022 07:14:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W0Sz/+qcb+b3CwVs84PmDBT77kPWuXrWj5P8gn4u4i3gHdp3SMw9VUe0HMSVQ8svPjoWim/gtCdMNi4g33nzzI0kWM2IcohQxnnoQZFqSRhhtUlBtg9zL752uFTwRl0vekrcqoKbDgn0myxlIaqf0x3dnHrhI0UkpnCwO0k9YaBCNKKhw4NwN3AD22rMMiDA1LnCQDHrIKgx8JvBzgreQCYlU+/aF+G55dq8IBjs1QmjL+iPM2P0vek9/U5F7pnCF2ZTvz1dcgZRtMxoOPsGXEFDdJRsxAG9tW4+2BMuFf7lUFAt2d+mfRsw8mannY/SUiGXqN3gdoj7Ud0tFG0bwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXDbLVPPCDSOLjnOIW4fpZo3lkirt0mZ9AlTdOOpx+I=;
 b=GYda9KnsvPWAMwwxWykxC90DzzHmi0Uf30yRLxAMeu1Xmw0Nu8CnGVAmtBFq+WpjCaF0bVBr3TpNX7Lqps6gc5tHH/+lNata4YhxdLRfx3wGNYWNV9k5ajH5YxaVy3rnTWJN1K6rcYm967A5kH9gbcW1WqeMhI1oqzQEINqek/71LrPTt5p1B4X7pP8UZybJfQziMumPOD7pwVdq9PZAllSFMNnqCf1oeVGdksaFDnFmHZb7W5vSzF9rR+t5+4+dFhj4rrAhtzfDY9Dzqqt/4MCGHoqKWCGcOeoL/Vhtv6CvzMS4HWdmqdjfDmFi0IJOfxHeLNzF8ibBjw1zC5p4cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXDbLVPPCDSOLjnOIW4fpZo3lkirt0mZ9AlTdOOpx+I=;
 b=ZSx+fediipBfmN/1Yb8u0IAtbhQE69Z8/URjMmy/du7mPJTHw2Ad5Xg6QFrCtw0lREUD+99mXqfiQQTUJAkMjYqBEuh5CymE3VYTND8aIgXZV+RNu4wzLLCeD4FyzIeN4YsG+neIR/uPg2mvyyVEHh5BgxrQ9OdIhuDUTtUU37g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM0PR04MB4418.eurprd04.prod.outlook.com (2603:10a6:208:6d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Mon, 28 Mar
 2022 14:14:01 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::45a8:8093:26f8:37d2]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::45a8:8093:26f8:37d2%7]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 14:14:01 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 6/9] media: uapi: Add a control for DW100 driver
Date:   Mon, 28 Mar 2022 16:13:06 +0200
Message-Id: <20220328141309.177611-7-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328141309.177611-1-xavier.roumegue@oss.nxp.com>
References: <20220328141309.177611-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P193CA0032.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::7) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41d07654-c6ea-4ffb-32d7-08da10c534e2
X-MS-TrafficTypeDiagnostic: AM0PR04MB4418:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB4418A423AE1E4F882262F4C2BA1D9@AM0PR04MB4418.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MygiLKcG0Hy0ebSCdNIY4G/EQw7I/Y8ClxnXc2iGAH3RfoxYo078BaqywoBeTnyngUQgVkq4LQ2bZjA3mgNN5wQ+281ReY8Tmtq0MLc6mHHMkLZ0kYbWehfXpC8UM58xjFQ92fSUUzGyt79fS5xX+dbU4KsLuVpGcgL12B2FHyVMxKsAx6VB3NcGZlTsJ7JBSLT8UcREk5xDq5JhpLVmyKf9srprNajJ8/sxis8T2YREIokft0Wrxu/ZfeyPuMDL8jkw2QG9N22mFksJQl5rHZsE6h4TUdbYdnQ/0+8YKWmR5wALj9OPFvu57plRRPjB+JKIr5RyGLNcSoVm7NhBrZFi0ZlQ7vrWELOclHnCPu7T9lmDTWsGSg0MfTl51TwppSLHlJAJdGA5sHv3l+inH2PqhFL0KagR9OMfT1JkI1hq8m1hQPsW4T5CX/QfxFDQchwMR2ATqL3EuyX3D0oS2WGMj+MhfDc9v2J2aU9h0dnMe4VN1+ODfxwL5XngOTWLyjMX2MJb9jFEyMircQSnixPBRPHIE78V6WnfxI8hphxmAP5HeDUEyVprMspz5v+d+wiQn7irgGQCoSZJUfnxbfx179DjeJViF+EHnydPuJU3HxApr+6GQkLv5ErzrcLyN0zrrRkbebcy1amPIIk0GOlWkEBJHtQYQ+HyBHXkJTZqtbg3KaeGsxdx9B+z+VPKESDiV0/sWrkafGxi8ekUIAjXOaNkzbSQ/EfNCQ0Srfw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66556008)(2906002)(86362001)(6512007)(44832011)(52116002)(7416002)(316002)(508600001)(8936002)(4326008)(186003)(966005)(6506007)(38100700002)(66476007)(83380400001)(8676002)(6486002)(1076003)(5660300002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?39IdKMAiXSb+V0xtf+63Bp5kIzAgDOWSVtefkzcdNEC6vGZwa40WdglGfvKZ?=
 =?us-ascii?Q?9WLqrVU8mEKM6TA4KGeVOfDOBuFh8YuAO53FcsonwX8qWQOsazMZyq2ga8B8?=
 =?us-ascii?Q?0SGF+9NJg3QqOzuZ37+xFpNTKh7nQ2i5OQopdoZMKSgcgxaBW423tXNaUy6W?=
 =?us-ascii?Q?wUxr9rGjhE6RCGRxGYfehsfkLzadimvsBhEa2K9F1/SFPu4OsHyhE9kow5cy?=
 =?us-ascii?Q?L0fIJmCFJ0feuBzrD0rC5XU1SDcM/eVLPV0IzWrZVYoSqR6b4Uc78qffVsTg?=
 =?us-ascii?Q?0Hj6xif+rZAjDHQTqCYrsQXzIyy7PVFalFTetUe5tSypbrkK/UPC63glzr1e?=
 =?us-ascii?Q?fvR2ODA4OdQqaZ9DtuXrQNOoV9uAs35e+EmJUDveFq+QAAd6Mhnc2unj+HLD?=
 =?us-ascii?Q?ALcwsPNhjG0WoVYLvM/GjfcSuYVxDo2Yrv0BDyPYGkVpaO81aYvGNKEuJow4?=
 =?us-ascii?Q?eUCEwrRet4xLh5/30A9c3OjKq9TNS8gyF52vykTrK5cfbwwcIxGCjW/9HB/W?=
 =?us-ascii?Q?hl1TYqhRQVmVh8aK0UB+Sb+lf/IjBzdeibrX3O7eUP/QYMjoc/jJoqRuRCKj?=
 =?us-ascii?Q?Ilks+Q9lHWROhpYdPCk8YkMjjTZDphNa4JnrjoQlcTRLisUiJIuS8HqjF6jp?=
 =?us-ascii?Q?/a9mlUfHoPv5+E431WHCFci7CiQw+m1IVUFb66PJmHWQ6skmsX5Be38gHVK5?=
 =?us-ascii?Q?+lJiseTDjFheSc6p5qbQ7KJBCXd5+07IWWTqJ1NONjXlDa/Z6X7Ie9DOj/Ff?=
 =?us-ascii?Q?xytcdaXKtuabAhimklPoe76ZPBDcObpn6BmjKgu7DAOYbMLNHSChMDKIoGdG?=
 =?us-ascii?Q?tzeD33cZ2DPkn+qAnbetSjBwx7YLon5BIJ7jnQmXPqJkrnqVCO8GBaxmJVXK?=
 =?us-ascii?Q?N7ZHldV/CcW9L+8UpvjD3kVpSueVlgLP3UuNfuy9pAJL/Mp86AoSL5hsBMFs?=
 =?us-ascii?Q?b99SjhAkWig20V7iVwAYhciZT2tER/iGTzz/v0GYS+ZAmjjgw/QwEZMZuRkZ?=
 =?us-ascii?Q?DaDl5BtrWCwXIgCZhT5ZSVRJhia+u1VqrSmGdADq9l1x+5rOdUNpuxaWDdyj?=
 =?us-ascii?Q?jEeFj3aPuZrck8ELMFvM+Htpj6OT4l+ueHHufycUEfSWNq4TKegvtFXA3xNO?=
 =?us-ascii?Q?U3zwlZE7ukzR7ob+asYgT8kLcO+EDVYhdipJx2Ef1WLFJKcYlI1X4ORY8RId?=
 =?us-ascii?Q?eiA7JNaarfqW1EfJxbpD6Pl+w+qiWOjdzfHk6peG+fHt1qDK+OredLfsnSrv?=
 =?us-ascii?Q?iYCG3k3SUNfmgaXc9UueqzxgPhe1U8hHJuOzTafZRrH43P1OYX6VC2mvgBpk?=
 =?us-ascii?Q?0DdCAQVyLf2HvlMpopg9SGtspxZs5Dp1jpl9HCz/Hl4/lyCREfm0bcOfqmQe?=
 =?us-ascii?Q?xTiWf9BuiUFmtF/7WQyw4mnxaL1FtJaKplTJ61QW4FIQq8p25R65FBwyu3sq?=
 =?us-ascii?Q?dwExseo7ulAm+iBihg5W0fxkSmdYzp85s88D5XPDJVOIGjRzEwyR0JAh8IH+?=
 =?us-ascii?Q?C+sD1i5tcxo/DghHNY6xG7CW4IBUhWQ7BaESjUgRN3Ai9Dj9EORHa+SUH/B1?=
 =?us-ascii?Q?iLSrxS916n2c4SuGE7Uf0hLIrOVDEs9N5xsf/wVEg5atTlo8JpocCrFLDCEB?=
 =?us-ascii?Q?lisY/glk03G9mfUygI7XphQ1hhbt2cs3wQI8s3XOGk41U7VYK5iKcRJdwqrQ?=
 =?us-ascii?Q?nbUk0pXL4kqdr9BAs1VB+59f1rkWPXmlyWyeXPWxr37sGiv1HKUZ/seyZMQq?=
 =?us-ascii?Q?HDOLsxmLwru0Ki65nFWKLvZniSkGorwk4KsDuxPDZZlzSqGpK2ndOVLerdfH?=
X-MS-Exchange-AntiSpam-MessageData-1: CmfgmteZr93i2y785G0ipc6uW+CHiRQt16Q=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d07654-c6ea-4ffb-32d7-08da10c534e2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 14:14:01.0843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+I5RY6FSDUjZB6JqSp+MLA7sJFF25Mznw5HvokobxjpbvcoAnEfm3UmSh7rYMSbpYm5CQmPyzf6H37JZvY3mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4418
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The DW100 driver gets the dewarping mapping as a binary blob from the
userspace application through a custom control.
The blob format is hardware specific so create a dedicated control for
this purpose.

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
---
 Documentation/userspace-api/media/drivers/dw100.rst | 12 ++++++++++++
 include/uapi/linux/dw100.h                          | 11 +++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 include/uapi/linux/dw100.h

diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
index 4cd55c75628e..f6d684cadf26 100644
--- a/Documentation/userspace-api/media/drivers/dw100.rst
+++ b/Documentation/userspace-api/media/drivers/dw100.rst
@@ -20,4 +20,16 @@ match the expected size inherited from the destination image resolution.
 More details on the DW100 hardware operations can be found in
 *chapter 13.15 DeWarp* of IMX8MP_ reference manuel.
 
+The Vivante DW100 m2m driver implements the following driver-specific control:
+
+``V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP (integer)``
+    Specifies to DW100 driver its dewarping map (aka LUT) blob as described in
+    *chapter 13.15.2.3 Dewarping Remap* of IMX8MP_ reference manual as an U32
+    dynamic array. The image is divided into many small 16x16 blocks. If the
+    width of the image is not divisible by 16, the size of the rightmost block
+    is the remainder. The dewarping map only saves the vertex coordinates of the
+    block. The dewarping grid map is comprised of vertex coordinates for x and y.
+    Each x, y coordinate register uses 16 bits (UQ12.4) to record the coordinate
+    address, with the Y coordinate in the upper bits and X in the lower bits.
+
 .. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPRM
diff --git a/include/uapi/linux/dw100.h b/include/uapi/linux/dw100.h
new file mode 100644
index 000000000000..7fdcf2bf42e5
--- /dev/null
+++ b/include/uapi/linux/dw100.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/* Copyright 2022 NXP */
+
+#ifndef __UAPI_DW100_H__
+#define __UAPI_DW100_H__
+
+#include <linux/v4l2-controls.h>
+
+#define V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP (V4L2_CID_USER_DW100_BASE + 1)
+
+#endif
-- 
2.35.1

