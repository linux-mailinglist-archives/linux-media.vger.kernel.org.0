Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0C754D2259
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 21:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350159AbiCHUMK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 15:12:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348277AbiCHUMK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 15:12:10 -0500
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00087.outbound.protection.outlook.com [40.107.0.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF2D47AE3;
        Tue,  8 Mar 2022 12:11:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ad8gC7BFUjrHpmk81zRZbItCSiNDkKHxIdUXYVqeXppt3aKw68QWDNmsMF+n0mt6RwnVIbg2cfYaqTfJJpVqC7MPTnvw0uH64l08jzChg0gOwq/ydmJEAXhc2xS6N1VQ21ibP0bclnZ3tkR9hyZl1ogSJIa4PCGrji0aULHHBIdoWlHWH3hpE7O51PoWNe3uSdkx7PKMNz5Qx/v33yEqMsoVpbCONyBTSONdgo5fxk8xPdw4L2aPJYxGm5RRE0ePhKcXAaiFciXA/UQwzVIJxC4whq39X83kRg01rcjURy4MF3K7TH0QAU8MXWx5zGu2am/Tom7hV2ToPfdO8qtvHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OM/DKgSsIzJeT1qlJETPPBmKykEX5Y/SIokEEoRAwEc=;
 b=aVArrEbhcbo+QwP9CEUJUmMKjri1LrPG1OfsAcAaSekzRAIgKh/dMSe4zCJ7rtpe7HNTqiwjXmGU4OpIOXn0zwDkAUL/P1OxrBNP3qGTACkRt/N7S+/OPYTdM94ElnXvhRWIjkNe4qi7jl6bUUm8n9AS32PpHHbtm1ChvYWHS+MGQhKjBSbZ0i513NGI1PNXOCVywrn82ajpfEoCsgrlC053zgHE4x6exk+InZQDytygOHCVo28t2+B8YWVR48OPBTVZzZF35qK8Hwn/zle+CFqWL/kNGxuu7/SE02VLHt5Rww/XCKbf4VbZ5LZQmlIWKLHpgn2wSq92KKC16ZSF+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OM/DKgSsIzJeT1qlJETPPBmKykEX5Y/SIokEEoRAwEc=;
 b=Oi6vx7W+cIXQV82Jo3wX8Kg660yrz+4AJWq1P2mnm6ULG8vxHmaISkyWYOTYL5UREmfrBSnlJOlRAQ0GtkS/DjiXSMuxlL10RJBzYHbXq+TXBiD+m3tMicrc9d3dRDaolMJDIVMYb/LasDS/4SnYV9wqeijHAbaR9rIRYUNZ0KM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DB7PR04MB4588.eurprd04.prod.outlook.com (2603:10a6:5:35::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Tue, 8 Mar
 2022 20:11:07 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 20:11:07 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 6/9] media: uapi: Add a control for DW100 driver
Date:   Tue,  8 Mar 2022 21:10:35 +0100
Message-Id: <20220308201038.48386-7-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308201038.48386-1-xavier.roumegue@oss.nxp.com>
References: <20220308201038.48386-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PAZP264CA0140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f8::7) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9a826e2-56a4-4067-bc97-08da013fc76f
X-MS-TrafficTypeDiagnostic: DB7PR04MB4588:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB45884136C70770BF21BBF3F5BA099@DB7PR04MB4588.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qXJKUmKSsqFuiY/QnoNzwsDOcNOxJ7TT77/r4XL5YwvM39XGhtmpocEcR4jcOK+LMkgcKn5F7V6MnGbYFjSd/mkRQxOBR6r0a2Twt2zLtNY5ffXrdn23vis4CTTlVUZtu6xKNe93toBhz23KA9Zlhn0E6t7lYlIbodZabAXAHVhD6mmS9Y1592wT9FXrQTGtyXqNt92bdURFnykjmN0JIPa4jAIBJ1Ez3aGT/cmd8yRT3dM5o2drkEnqMwD09FKqSq7VU1oDdg9U/KW03F/2AM75ACZ0zhA6IUFgJA1GHnRWqMAVyj3z1ap+0kvfTH5++SBCcNhKog6SkaW55tr3LlwBHQ14siBBYOSI2sPDKAX/G7yVvIcaJDt+TyDeAICa2JdaoWaZg1mcqxdpj+CXw3MT0k7KLlVk8ChWXuUQfNu+YFeIyQ4xkHx5K/WJaoDyZCzGwHuK3C048yTIwvuJkfDM1MzUCHK868EipIuaSJRYxsDTYSDw3T2oymP3ynumC4iT366k0E6F2gWibGftPkp748DUI4k8mNhwE2UC0bp6RJwFQiUs5q07pp65+roX7Y87hXVdqN6jhUxphf47dXyzBSb8WJbWKrhKGRnedNcq9xL3vWmEkLhQpNbkgw8HPDTjRD4ueE8N4WRumm0kyle4DhxGQwAi2Nng4Ez/lOt+zEnyTzav/9FPrGeZvsl5dCOaTLb9oQg+Lmq0ZF9R6ay/8TZFdxO63srH25xJtP0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(52116002)(6666004)(4326008)(2906002)(6512007)(5660300002)(44832011)(8936002)(1076003)(186003)(2616005)(86362001)(83380400001)(38100700002)(966005)(6486002)(8676002)(66946007)(498600001)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dQzkylvPIlEOUWNeaejYu444zoNscova/zsypIjplVvjsrJkw1DfWKwhAld6?=
 =?us-ascii?Q?v5vI5Y5fOHb3+UJjJvtoqFYx1rxTX2TqRQpLqXoU8p9S3lTUwZr+qENhBR7o?=
 =?us-ascii?Q?dPuMdZAImKFEVNI5uU6lCrL6FyO/cYQ9WvH+/U1G3BesIyw+1KnBBy1b/swK?=
 =?us-ascii?Q?RaUL9BM2DBam5GyNDFDsTnGHp1OndFNyYXFIjsOIZbOGcOCLdr2y9N478V9i?=
 =?us-ascii?Q?ao45g3Mq7qGrYaAT53phF/uCVu9TlgF3ZLb5su8g/Cc36lOhJMJZQIyntWTT?=
 =?us-ascii?Q?TEOew+TcHZcwIjoRBsbchmDoACntdZVN8Beirl/CNUsjwTanJrMxAO/zJjpp?=
 =?us-ascii?Q?VDdafwRdhbNOjigboNM33O0uouC5S583nxNtJ1GLXl/aLkCV1Ce8XfBKgE/m?=
 =?us-ascii?Q?OS0R5X04mD3D0M6qOYdX+P9wmXOTrSoi7YsE/6sjHMrVVd0K7a0lU4qnq+GB?=
 =?us-ascii?Q?7l7XRFscFlqGUKW6Mz7tOpuH/n7yp3EouV4wpAYwoXmHmCBBd/s2ju5No99f?=
 =?us-ascii?Q?WeKhn9FedcRw6+FyZMmSoUMOCq85wRnXf7CMCmIXA2CMl+tu/15oot43uZrO?=
 =?us-ascii?Q?n1AWSt0wTg0xY3gbyd+mUzFWtcJjPpzZvxLZieR0ownL9zFBOSYe9dcxquRh?=
 =?us-ascii?Q?sbrfsWkn1BWgduneFe8Nq7FBKyWWG+vkakQOCDgb0WxRWOZeiiW4CIKKnS8o?=
 =?us-ascii?Q?OV8w7V8HLYByZguB5MWOzxY4tgwWwMAtHXklxN+/LOhjq1cfzyzQ3xyqqklt?=
 =?us-ascii?Q?yg833EZLG9CbWIivnJQLk+hCOyn99ZSzOOIG7FofRxHe4TWxAcfThT0mGiis?=
 =?us-ascii?Q?qZ3ZU3lLz61KBf9ZIwQAIskzOuYlq2gFraCZE4rs6TghOZw8vVP5EjfTKf4W?=
 =?us-ascii?Q?3/AGY8WhFU3yyCRKaUbaUFEdzoLah1TdaEESUimeIBmFVOn55xGAnPEVu9uU?=
 =?us-ascii?Q?yyeEe4OvyTGpXTvRLQBIKdEg4cCYFZvByf5iZDzNg4ztIk05eZk/BIMmCqUO?=
 =?us-ascii?Q?vWq1kj/iVoOWc1TKVB/3vvmN66czg6xISCMe1LFzt8vxVLznyiR9XfOn8SBo?=
 =?us-ascii?Q?JMSi11NF4fbh2VpMs6g5KFtz7ssyZpZwQYz/46RpO7NJvBlyBd8JGFaHhPdT?=
 =?us-ascii?Q?48jc78VRb3A6lMTNxfjd6uCPoCz9alOTmFbsl5OSUVdgC4yib06HQlafmBEt?=
 =?us-ascii?Q?cyFrrngBX6Ub17NYpNyGZbmTN5qSvKaVnyTP49bRtSNi4F7wwlsSVNwWV5wv?=
 =?us-ascii?Q?fTjLnmK0TMLGDm/IbmaQ0MB1O0nklZs+CbGNLpPNNT8CEhv6ziWy96sFFIAk?=
 =?us-ascii?Q?tp3JGUeJvHOopHoS12JEmVjrn5ZxyO0D6WO+lWoYqOJFesz7xQrNBrrsJb7J?=
 =?us-ascii?Q?w6wbHrHaZNfytJ/4hrLtSk/x3oDipH6PfXGRcX/nFP6FgSGWsA4l2UqzYww0?=
 =?us-ascii?Q?5PnunGYrwvFT586x4JlnIGplwkBNWQl4k5YZP1XG8xpxZPWDnccLdZqclaCd?=
 =?us-ascii?Q?3V4kbqP6SGEX7HPola7Tr9qzjg9PnOYDHXLzmUDVkcaksSV4DuW5431/Zukr?=
 =?us-ascii?Q?JwDd59TcaxNXSw/Nmi/zEFQ7XREoyOAjBqEzVnQvb/AM14k7+Q5Z0bN6THci?=
 =?us-ascii?Q?EicZusW+1fP7G0fXb60fl74O/i0RqqUsqmCOJdivAfBsS3ybVDqa0MkXPajR?=
 =?us-ascii?Q?VwhTt4NEc10WEFtm7wRy0MNewMc=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a826e2-56a4-4067-bc97-08da013fc76f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 20:11:06.8308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTCzr3Af6Ux5WhrJTPJ1lYwjOYXWdRh5QPgPgr+dHz96xVve39KT9boU/6KzMPDpSmvV+cZpmD8aY42sHWSG2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4588
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
 Documentation/userspace-api/media/drivers/dw100.rst |  7 +++++++
 include/uapi/linux/dw100.h                          | 11 +++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 include/uapi/linux/dw100.h

diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
index 4cd55c75628e..576aba0708e9 100644
--- a/Documentation/userspace-api/media/drivers/dw100.rst
+++ b/Documentation/userspace-api/media/drivers/dw100.rst
@@ -20,4 +20,11 @@ match the expected size inherited from the destination image resolution.
 More details on the DW100 hardware operations can be found in
 *chapter 13.15 DeWarp* of IMX8MP_ reference manuel.
 
+The Vivante DW100 m2m driver implements the following driver-specific control:
+
+``V4L2_CID_DW100_MAPPING (integer)``
+    Specifies to DW100 driver its dewarping map (aka LUT) blob as described in
+    *chapter 13.15.2.3 Dewarping Remap* of IMX8MP_ reference manual as an U32
+    dynamic array.
+
 .. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPRM
diff --git a/include/uapi/linux/dw100.h b/include/uapi/linux/dw100.h
new file mode 100644
index 000000000000..0ef926c61cf0
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
+#define V4L2_CID_DW100_MAPPING		(V4L2_CID_USER_DW100_BASE + 1)
+
+#endif
-- 
2.35.1

