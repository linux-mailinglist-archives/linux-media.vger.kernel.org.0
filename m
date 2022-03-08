Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7EF74D2079
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 19:49:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349678AbiCHSuO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 13:50:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349660AbiCHSuM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 13:50:12 -0500
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50071.outbound.protection.outlook.com [40.107.5.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BDE152E3C;
        Tue,  8 Mar 2022 10:49:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJRLjUIBBYalhYvadDdSf7umv69yEuU0PlCUBZYCbIsPkMUDIu7rnBxvFGhB1Wc0iDYPUDEVoYf5jwJDVIz2Di0KzK95NuojfjIf0irUN3b0oUQ+Of8NpBRRzxqu52AvHL6H4tRdisJXndJ98sGrB4NHL9BskFS1RqZIZlZqF2/gOu2c0Jci3UcfvCpuVeEen45R3BRQHVo+jQ+b09GUkyPd5FrWBme2u41K/mm0HzPYErS5h09sogUFLvIT6MsB5DtZEgwsMV0UOY2rjS+bO8z1S/Dm8BImh2qOINtRU4WRX7OjXerdH6PYrGdmKMEa2zJfJZFEl42myXbKItCwhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roOCkUdbGizXqSiw7kyURKbwtlTm0mvMOxvPkVRvWPY=;
 b=F5zGD4r4u3fDxTqImPlhpU973U1RYE73RT5uSqKqx0nZWpNf7LiVIuQEDUXEgPoNtt+EsXskuQ6vRWLoSz8L6hw4GZCslCbvF1E6ICdZyImTSZ0bm26MZaJIc2V8APTA0TMpIDdxwZZy6krFAQZioLg6fX93Arc3J/vTvZVE+VFQiJS9eepX3x6tANPWxeFkAuHV+xlo87P8j7Ve5aN/awUi4858ZlCSIadzGhiTYULlkAH+GvCRO19F+NZbO/Yl8kGYd/U4XclEOd3dmC3RMIvXBEJmdWV0fIjShX0ZkZ+ZylewiJMmxFvEOcS1Cxg2INPD9oKnKKZfTMzDhtxP3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roOCkUdbGizXqSiw7kyURKbwtlTm0mvMOxvPkVRvWPY=;
 b=WA+23zDyhAdjEpBvm0HegC3ndmaaKhDwQLu6DOelcfTtWHKYWpLgNhaxQuOHHJ32/DzgxWsyaZibOPsO3vTQzDeOHXjTQhaRU2blB+qo7TlW0dXcdUWYqQkpCZPyBOmetYSKjg/9R5FqcHKsukTPD8+AN7n+AuHrZoI/f2pryKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM6PR04MB4311.eurprd04.prod.outlook.com (2603:10a6:209:40::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Tue, 8 Mar
 2022 18:49:04 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 18:49:04 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 4/9] media: Documentation: dw100: Add user documentation for the DW100 driver
Date:   Tue,  8 Mar 2022 19:48:24 +0100
Message-Id: <20220308184829.38242-5-xavier.roumegue@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3f94f65f-73c0-4bda-87f0-08da01345164
X-MS-TrafficTypeDiagnostic: AM6PR04MB4311:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB43119060D002819185B53C4ABA099@AM6PR04MB4311.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JhPgSnaaqcO2zACFPek0cky/UcT+mONmYi7D4W9fLuG1txNeCT9tSFtY5bF3LZRwgy3Kqy3gZulz15q4e/lCjEg61EuLC8clZ8iAJu5fW2IdLiWT0I/ftuHy7t/6WCr0hdqo2nX+dAbde21wo32OQks8lskG0xBga/5nJfWcBmDGEJSkyR3SbxQgA7tppZXwPqxX/Us1mqJCNa1eYNS7KBBDjo379EgqQtEA+MXuTlCoQm4cFaPHiiFKMuQ4DGKdfQ/mBgVhIOpqFJFMLcZi2xepgRlaQ2OEmEm0TaTcyO/nmyIttLei4tBnakq5PlY+AO+bhcr7ihvwHpVwSDJmsrKSujEEChqxloZUrufUkH89AIR4EqAIh6hFMNWLVZ99bkcpHvc05FS9rLR6VOeBItjOT+lEiMN/03g0VJCZjWSpLPt4MTsKMQqVti6d7x1l4UQn7UK56v7007wwV2hpDUYk01PmqP743AyunJNdM45Jfi2nAKClC932M/mAsUsZmx5cH0pfA4ed2MiHhw33nT3XbyTzUB/ejsx9FTwML6zalBduMHhz1+YQcLOXPow+qzUxRZdHP1REq4PRtx2Di4ZsdsWQH9dBsIET59TJnsHiLeggRz1GykOvjNf+W9cSzQ0W1v14AMESNsW7xVZTWokEHj7FVDS7GkHUog1eWQjBVsUSsO3wmc4SxgJKcgxl2+lISsIX4NzhAj/2L2jkdJzgMC24cTgjQ+dGTGBU4Ak=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66476007)(4326008)(186003)(1076003)(83380400001)(6486002)(86362001)(5660300002)(8676002)(66556008)(38100700002)(2906002)(44832011)(498600001)(8936002)(6512007)(52116002)(6666004)(6506007)(966005)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fp4vwc5uAjKX+XX2Sine2jausFEn/Z8pAxoZTUg7BBQqkGX0NVLFdO/ftlnK?=
 =?us-ascii?Q?umydRRM7cBraMwS8bbQRa/H+K//L75Jsd2iCCBr5NksEEAbUchotOu1LoA8k?=
 =?us-ascii?Q?fxjEV6UgsobO16ft8UWaBCmyYqpN0VBnInORMsnIlllWa6+1Mp/R+E3HJOxy?=
 =?us-ascii?Q?+CqGULTAmkypa0aD7hiM1PwE9BNn2v4DPCLkCvMZNQv5Sp6iUY0VkocE+F/c?=
 =?us-ascii?Q?2aYvfiNRvoFd/lKITilYA7YNOzLG0N7J5llR29OgKggjB16qA68rhsGjAimw?=
 =?us-ascii?Q?yvk18bcdWcfVrpnLQdRpk8rDkTFfx5p3ok+vmTqkjeIG/Y8IBBcsbDdUff3v?=
 =?us-ascii?Q?ZPWLEL/0y2t3xqHIglKD8YdnTrw5Q3Zb0l0ceaG/Drt3TCxrZGBg+amJHQbw?=
 =?us-ascii?Q?XFZZaB0fYHgQ+2G5zWjGrObE+Db8Hu5NFsLesE/gN7y3DxvOwDtDtBW3xhdY?=
 =?us-ascii?Q?OozDB2YEWfZYOP9LWonKzXM/SRNhJ8CU0g8gkPNnmyfAKXEIcpXvLNwzPal/?=
 =?us-ascii?Q?MsE6YysSNmVVw6UYbQjcEOSD5bV3bqWVSgacrklR5xBwZGKED3iNfNJrqWUs?=
 =?us-ascii?Q?EZADfL2aCI6+4E96bGpX7Qfzg5YKST5/MS91jdUN+YTXaAB+BaUSMJ1sMaPe?=
 =?us-ascii?Q?T2Z2Xk+/Ojeu7u6owPOLoJ3bD0NzKjiZX3PaRy5/olqGXnGBOkQHAdPekqvz?=
 =?us-ascii?Q?7/Z++cuo1umGUGsq19FnpkIpuwFi2cPinkJGxFCKCpQXTzbIYMBC6gDYM7xC?=
 =?us-ascii?Q?M2goHlglzCSB6HiiglIe0AgIcLvJnssnlEpfHU95dbZby2Bh56e7VR7v6x+V?=
 =?us-ascii?Q?N8rUWnMp2GWiAf5sgo9fHQy4qg+PKkb6dgneaJJMoERELEscVDiIJKVfQWHR?=
 =?us-ascii?Q?WZdRH/sGClltP0v5vd/lZIIjnYOFftYU6TXG4Mk03+3C8oql2NJRqtgqgzEN?=
 =?us-ascii?Q?wkV0eVbU8Wt9P+REmlluIZmWG8qaOgSboV0zDwuTCfXXcx80slMax9zjKdLN?=
 =?us-ascii?Q?LGbhM4N3KLHOhVVyGwin6Uf79E+70yFQymCEXiaIvW3rtlfchn0M9QfWrY54?=
 =?us-ascii?Q?D2XJpKtW8nWoIeXC7tbPa9vIZzfWGzpKggatVajVaGMU1j28Qb2fShd3yggl?=
 =?us-ascii?Q?tya2nP9+cQCZ6YqRsns2iSUqHItNCo/inEAPG56RUVM4iMOaztjrtEgTWOm5?=
 =?us-ascii?Q?97CnF1+593396jxLqa7HDzCczvGwNIbJmjPCYGkrwqQDiEkXKHrLyWn+qJd5?=
 =?us-ascii?Q?0VPS3CxLYNxPKpCFNl8K+J6v1MZO2o8WpesnqYCctLqKOW5xEkO9q4vRazja?=
 =?us-ascii?Q?kHtQgyVEgFPEMsFfpQU8HywJn/qiJZMnWlXEkUusFcrRLELp4f5rawgbWjex?=
 =?us-ascii?Q?++pGsFe4dmb5tXsCo1PrqitYxIa4Y6ZmeqEn9m4sMdhEYnPIHttIzYpeqy+6?=
 =?us-ascii?Q?QMvRfB7F7DXoiji79YhnibM+jliEsfReJYYNqpCvhKjsCeWql7iC6ri06Ux9?=
 =?us-ascii?Q?ED9bcAyrtoInoe4Ftm/sYIm4rc6DaT78VaWk0cwJ/FgIrqu5MicWuuXVO8Mz?=
 =?us-ascii?Q?d9CEtoso58/4oDM5oXLjbkfzhFbDIItwh/M2PrGykrsYM419faye3dEZEyLc?=
 =?us-ascii?Q?u63NIoKBUeFNGOHwraqVUwPUSlKOb546WUj8N3YVEiOuBth46R91Si0ZjKhJ?=
 =?us-ascii?Q?Pk00WwfmvXgEK3LfqRwmM0Rz95M=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f94f65f-73c0-4bda-87f0-08da01345164
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 18:49:04.3066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbktPRFU1USPbrsg5FDkPXRAuIBLcrSD2hyqHQm5j+i913syckgUPU3L8hfBUPdmnpJGs4kb9Wumhat+IAbnhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4311
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add user documentation for the DW100 driver.

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
---
 .../userspace-api/media/drivers/dw100.rst     | 23 +++++++++++++++++++
 .../userspace-api/media/drivers/index.rst     |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 Documentation/userspace-api/media/drivers/dw100.rst

diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
new file mode 100644
index 000000000000..20aeae63a94f
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/dw100.rst
@@ -0,0 +1,23 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+DW100 dewarp driver
+===========================
+
+The Vivante DW100 Dewarp Processor IP core found on i.MX8MP SoC applies a
+programmable geometrical transformation on input image to correct distorsion
+introduced by lenses.
+
+The transformation function is exposed by the hardware as a grid map with 16x16
+pixel macroblocks indexed using X, Y vertex coordinates. Each x, y coordinate
+register uses 16 bits to record the coordinate address in UQ12.4 fixed point
+format.
+
+The dewarping map can be set from application through a dedicated v4l2 control.
+If not set or invalid, the driver computes an identity map prior to start the
+processing engine. The map is evaluated as invalid if the array size does not
+match the expected size inherited from the destination image resolution.
+
+More details on the DW100 hardware operations can be found in
+*chapter 13.15 DeWarp* of IMX8MP_ reference manuel.
+
+.. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPIEC
diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 12e3c512d718..8826777321b0 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -33,6 +33,7 @@ For more details see the file COPYING in the source distribution of Linux.
 
 	ccs
 	cx2341x-uapi
+	dw100
         hantro
 	imx-uapi
 	max2175
-- 
2.35.1

