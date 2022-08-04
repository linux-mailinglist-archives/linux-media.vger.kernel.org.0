Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68BDE589BA3
	for <lists+linux-media@lfdr.de>; Thu,  4 Aug 2022 14:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239520AbiHDMXY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Aug 2022 08:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231301AbiHDMXX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Aug 2022 08:23:23 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70071.outbound.protection.outlook.com [40.107.7.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B69843E44
        for <linux-media@vger.kernel.org>; Thu,  4 Aug 2022 05:23:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gg0owCNMk1O/dYu6vDHkmcE3hSA/QZTCkwlN7zbEOXOuvMU7Jkvrh/4JKEbHukPySKzrayBb6bYo+gZ9bQCLlyrUp5DrzTCy/AcgFKBV+TTQEJM0pu77isLMTqIDZyxLUf5LrrHhthw3AbDp5isy8b/nn1b6FGZhntv9e8TJknSBSTcqU2DZULkSNIXY09GPqylwfTfi3EfZvEhqlJL/8W889QgLXqmPAb4lYVThVoty2GKB2/G7tjf5ibav3Fx/cMEorxgVbiTdh/2D7yp6v6/zhGtaZeYRYZ8JTiKz5Tkefrd7Hmxkg+xCIQZmy6yW7pR4tkR9HwyQSielHPiHPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smsVjmtgUjYN7/DK9ut3x3A8iQ84jZDNRjItR7sCgDc=;
 b=QVK9U67vNYDLnb4ESyD2Zii7gbWrKSwbXHcOahd4WxPRBSIt/3Z2MCP7TLn5hI+bpu+wqpMjxFVABk0gzDPpPPShMhB61aF0NwiJBYfiADBZFWIp+8Wo7TnXjVxgxHDqJRS4lMV0KanVvZsH+nSYdXPBiqSU/9t/lmkZaF/jz3FMWliDmjC4Oll5S5TdyNWUiSBphx/L6lRFhs1Walxtu3oZdxNUtX3kYa2IXSUsLS99UE0JRopDl7Upzr4xoWSNU1TVrnNKet4K9+zOWHSI7grbFOylPPc98s8UL/3zrUN79aA9TCUDo4N2zCLjwAYhoBR/cXWQUAyJHNYJ9nKCXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smsVjmtgUjYN7/DK9ut3x3A8iQ84jZDNRjItR7sCgDc=;
 b=XC3yK37f+0qV5cKkXzTINfTCzNIjkVPqYiXlimtMmlkd5wEKGapppce7pA1T6EuJ7mgkDyFsQgInYgz7Os0PcXCx3+doyDjiMp0rgruR1mUHQwlfVVJaMGM/4d+FVnHVW02oSJAHmfVAcz9z6R/8CNO15CvO4bVkATThPMcxUw4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AS8PR04MB7592.eurprd04.prod.outlook.com (2603:10a6:20b:23f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 12:23:19 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f%9]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 12:23:18 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] fixup! media: dw100: Add i.MX8MP dw100 dewarper driver
Date:   Thu,  4 Aug 2022 14:23:02 +0200
Message-Id: <20220804122302.2218906-1-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P250CA0013.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:102:57::18) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b2b757c-4623-495a-1138-08da76141c96
X-MS-TrafficTypeDiagnostic: AS8PR04MB7592:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ey6DyoziEs99M+1q1o1atTPDSLq9PrB5/dljSWtVmq764k9j5Q9nZ4NLlu0HMrJQYnBkg7xYzOAwu5mdk5bT8FRxC3oHdLc8hRVO77XuqczSxycX3SeMYxEeW424lSvAylZ2Jt+439boiKrB8wUYRr0ZOHXoq7zGtgvaCJHNXplQxsXCu3Doqy0zzBASsvp/4SWfRM2dTDla9u+WGjBa8FL5MlOX71omdh34M9MPBw0rYlKAiqjBJXNBRi2RQ6IsVLorWsKZxDc2UDEpGKhlP4lT+n2K5J9cz9PTTdZuLgCTJO6UXbXJFOSY1t1jtjOmGc+wbRY3kg9VKqjnEsJ3z2/GCWI9lV5rSfCzq0aJSym1sPzTTYQK7+rqkYm1aGph3d40aAl23+Ew7JM4qliNqoR8OTtXZqMZdP5YSUNQOWXFZO6Ci5ft3L6icY62DD2CXsmtWa/C8W2p2Nz2WiXBPv4xGfR461JpNrYGsZxGtruwc7moZVz8kAU6d/6iMngU6aM6WED9dBXebwXKk5LF/lOvysTkaf6448V2J7J37x3tidqG4ar39ET5oJ588lACJ3VKrM3bGFPd/u6kWzUhM7QEcFGFcPrpZmXKrqpHyiAWBI2Gx7/lTBD5niEa/XTwPo+a0XDaJlXGzaFkTyTTP3nsxv3UMFqi+KCZNZWbLl7BWe/YjRofA2PU+l8+3r0+PtFq4xgcf+C+Csauxrw2xTHSFZ/vHEKBRTE8Rq4tXzNO7yOKB/8bdqMPuTqmvgv0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(6506007)(8936002)(6512007)(41300700001)(52116002)(38100700002)(6666004)(5660300002)(86362001)(44832011)(4744005)(2906002)(66946007)(66476007)(4326008)(66556008)(8676002)(6486002)(478600001)(83380400001)(316002)(186003)(1076003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UnqvnoVbkz+c3y/LdgQlhctIf7XMLYNFMXMPLkKhBeQWBZKCKojY1fgdCJtC?=
 =?us-ascii?Q?sLtWtQS43iF18PRuh6pc+/s8pJJ8kx8j10w71RU5hjF08rPcwshU2BHI8PJ+?=
 =?us-ascii?Q?r6K5O9AZj7xGAWqB+Dkb6MMloFzF6kR88MqsrIkjcrr5WfD4NrWfX2gYn7/9?=
 =?us-ascii?Q?s6chGlgI96izTF6WB984/DmV13xWZZ7/QjGGHsOGgLApClZTd2abFgTuoCki?=
 =?us-ascii?Q?/9XTHMxfAwqUj23KraTL7LIDYuK3BwjkOf1PrXwbz3v4Yfo8pwAvAZCNaeg8?=
 =?us-ascii?Q?6A4EMjYWJYKJf4dKIz9laNHVaPERX8PRjfQf/JdGR8AjoZrCXyeBJHWyP9k6?=
 =?us-ascii?Q?YA5zzA8Ki55Pj+sPjBjs/me2TUq4+h6FT4dFZA9ma470xg/CDXXnZsVjR8xI?=
 =?us-ascii?Q?wPrjvYCRj2jXC6dkwskKGOwMqU7rEDEZFSs/p8d6MNTaiB+Z6OSgOaCw6inL?=
 =?us-ascii?Q?Yczzz9fSP7kYFA7fu6KIqRa6MHOvMRHvJqnS+/W/0ybGggPxnKXIKbd71cIq?=
 =?us-ascii?Q?o9TLjAckNVKjxdO8r8BfkgIpNyIUTDZQO9QNE3GxMAnz+I2F3T4M4lcKcQuS?=
 =?us-ascii?Q?idZLnwig3ZtWF4VohTEWF1peKAODIoDcaw5ToK/u+LcvnwmOArdCbe80YcG6?=
 =?us-ascii?Q?24mXRPBmtDvOUmrsyxQYImI8l3qRtx+igvGA2V0Xe7xybt2nRhfLeW5BRx1r?=
 =?us-ascii?Q?I3Vrdj8we/Gbq6BFBwVMjQgPNXqoy7S4TQXPGsne8cgHPne+QCMy5YrbQSag?=
 =?us-ascii?Q?l4Uk6KhA1sxNK+abCrS5hL9vvaqbk/aQM34EjVfuW4HT5VNYHOVfDIlJWjJ9?=
 =?us-ascii?Q?M7fCScYRQG1DCL3cPem3qIL0Mp0zSNaCr/lstjgoRd6KVjmlIqT0qttLlp2Y?=
 =?us-ascii?Q?vAhv40I+r755S49Q1nvEa9+yRtSplnyrIJprxzUCBG3AEJqiYlLzfeSgON74?=
 =?us-ascii?Q?Rg/T2YX1KObE6+RnWqWL+e9Ei7jMlIJOpXSdwZ5zi+WTHq69QVKRRD/18V6i?=
 =?us-ascii?Q?Ohgs58K2w0Y0yoHzvhHWZERpN1Pgaa/cSsspf+EEznfQZZNSiTpOdrfDqum0?=
 =?us-ascii?Q?0RyMbsLN+fs/GSGQTPZQs50A7zH9Lm7vT3Nzn2DyLue4J2SYpE8nrOJt2B2j?=
 =?us-ascii?Q?PmZMEI7YpdcjuypPPGWHedNPVGSoTfLnBvYPOg1FuDCDDwWqh0GcPog+hoLG?=
 =?us-ascii?Q?Sg6rr4Oi9aw6OBtnbBDBCmGMvQNZLnXRz3VPuHrZKki+V+xNH7R8cEgrr0rH?=
 =?us-ascii?Q?T4WjR/PbNDsBjTE9t4io3a1KltpthBsR/FJNGUt3D0u91nI1i/CcD3AZRa0d?=
 =?us-ascii?Q?aOuwnV368kftLI72Leq5/wyojJq+au7D92+9ivD5yXuurlsdPoUJv76FAsLT?=
 =?us-ascii?Q?QnREZNGdTM4mIGpl6+BSOWng+dO1eurrwDY7ijEMZ1pGCDN1RpIFLqMFWxkN?=
 =?us-ascii?Q?ssO5UzrqBg7P77A3Rwgh/p9ffKJdGamybsGdOarjrGMz9T31VcvpB3kP9NLH?=
 =?us-ascii?Q?u1iVmW5Jdy/UYQiwL7sxeMyJ5/r7d/19wlkbtdp1LsVp0BQkSYQ5VQ0VFO+r?=
 =?us-ascii?Q?G/RICXxlKBWFZyDpmQHRjH/tBwRThvtQg3v4xIKShlNXkUgo2ZphxnSIZA0f?=
 =?us-ascii?Q?3hvWYkL9HiwYMNByx9GVnaSnjT89lur2XXzpsAhslSye8FmEAorFXWiws+Gi?=
 =?us-ascii?Q?HNIo/Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b2b757c-4623-495a-1138-08da76141c96
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 12:23:18.0022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GtB/0sPpWKZny2IW5tDqLhqgL9+PfGMtpP91BxNRvUlrI6BQe1OxajW/eDnKY/0PoUgiiISlGaJZS7BDQXbM9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7592
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
---
 drivers/media/platform/nxp/dw100/dw100.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 651622f8ac8c..94518f0e486b 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -379,14 +379,12 @@ static void dw100_ctrl_dewarping_map_init(const struct v4l2_ctrl *ctrl,
 	struct dw100_ctx *ctx =
 		container_of(ctrl->handler, struct dw100_ctx, hdl);
 
-	u32 sw, sh, dw, dh, mw, mh, idx;
+	u32 sw, sh, mw, mh, idx;
 	u16 qx, qy, qdx, qdy, qsh, qsw;
 	u32 *map = ctrl->p_cur.p_u32;
 
 	sw = ctx->q_data[DW100_QUEUE_SRC].pix_fmt.width;
-	dw = ctx->q_data[DW100_QUEUE_DST].pix_fmt.width;
 	sh = ctx->q_data[DW100_QUEUE_SRC].pix_fmt.height;
-	dh = ctx->q_data[DW100_QUEUE_DST].pix_fmt.height;
 
 	mw = ctrl->dims[0];
 	mh = ctrl->dims[1];
-- 
2.37.1

