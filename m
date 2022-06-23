Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA7E557DD8
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 16:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbiFWOcs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 10:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231951AbiFWOcn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 10:32:43 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60050.outbound.protection.outlook.com [40.107.6.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE7DA4578F;
        Thu, 23 Jun 2022 07:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOBdpPYZUsg5GBehG9fDtVchRFnYLTJJ1rUPQDCmqk8ov2KeWYu2gEcOes7TQXl6TlFsJuhwMFGuflW3tHjMYoDhHq641QeR2Kmmt7DDSK4wicvJfpecX8pv/ZZnIljTqbNXNt4/P2WiKkhneQI1l+A0VhgdiyodAk+zcmoSNUcxOujUXKLdRCf8ZMsj7rj26D8/0BpliyE5ga+pnBZqdl+vYpSkhmad/0baXLjiNWY7RZn0b45SrGtkXQ7X5IGEH90FRKelgQkrUptkhvkvu6fcjRu63m2PIAFjJ1PZi8v2Kw/g++AD7oa37Zu5HKZ4qATUE583HlttUsO+UTyKMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qo/HmeunH1NHG1XXb0xWwHqLuUBAYsnJzAwWvlhyq0U=;
 b=lk5K9j/JeiI4WAwwEv0RyiLJVuU5sDRS69yqemaBPAgzw5IWbWzDypGRM3JRjo+WnA3YINZvfpIusW7FLwqCXWkKKtHs9gY4P8/3DptY8OxDE+FzcgVyd4xhE9vxtBsX4sWenLmfC1+cdsSYl6egaBgzV9UZN8ezvJIPvGwLIS8JagS9iERiljkziJ4CvV+2UUiYB4wS6PGTR5j0pCtUToPyK9MZMwch4+ELibBPECkFGNkDXk6DqkKZYgeZKBkZuppDarAbU18s+YhFwrE8vEyOkO1+6ICkmiwW8WF38uQvzg6QpzEb3F4Q8QE8g2ZVkY+Tiz1kECEWLNXKH5ihMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qo/HmeunH1NHG1XXb0xWwHqLuUBAYsnJzAwWvlhyq0U=;
 b=DwSW738D9b0o1KhQsFlW1GKinngn8Lsph6i5GN2FdGmAlMrXMALwBWl7Oxp4j05Gtd2cfpRueQeE0YFtyawKyf3bgkHW2VDI+wzi6SKPXOeoErX1sXUiMIEjh+ey0uKe5BBX1MKcCkS89tbqikfIw6h0+22d7VpIYbNUkCzVlHA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by VI1PR0401MB2288.eurprd04.prod.outlook.com (2603:10a6:800:28::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 23 Jun
 2022 14:32:36 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485%5]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 14:32:36 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v6 09/14] media: Documentation: dw100: Add user documentation for the DW100 driver
Date:   Thu, 23 Jun 2022 16:31:10 +0200
Message-Id: <20220623143115.3185297-10-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623143115.3185297-1-xavier.roumegue@oss.nxp.com>
References: <20220623143115.3185297-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR2P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::14) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc8d3994-0c56-494b-9b86-08da5525378d
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2288:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2288647C41F14D9643BD8523BAB59@VI1PR0401MB2288.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o61Qypm9yxq1JddZvTjkjyRai1cqPfEO3wrA6TSvfxcocfvFJq3McUnVTSbxFqVjSU9rvxoUnGEW4m+QrSEz2rWAiOdSalu1caU54ArtUgS5cNFBIWqT44u8+FubPvVfhMHh1aTuJpQnz99w8JGUFvntGtJHdOGlVOp/sCdRPWfrd7OHH37N4IAXzQbwSzgrMoPuThXa8fE+GDca5Pq8S3OiOKLWrF0qedFLtCSKGUA7RTmkWFgySYu9eCrm8+kkUeY5GgX+nA6iesW2zcShc7BCXMc+AZbB7M6E883oGlddKDoBJPyzXwYGoyXtw8v1zmkH/zUPcf9Isrbt5pAVe0fT7l2WLLmNW2je3NZQO9AUY4Hrs8PG4kfmIjlr2LyU/9ZzKMZR9c5IYgTWoBNzSP/XkWrG/qr3N/rUpxS8fhQ83RaAmsfXA3EJhmFCQwXDuA6QD6biiw41QI6BjheUWtfRFxkhhBNvojCLlT5UG+3/VvNbL6ztOVfsR9dsXpk6xC9kOJRA0mstr3cUMMOg5tz88V/2Dkq2td9vDwJMHGP+FKkTXM6+NaYjaMCoB51nKdBIyhmt6lLTIqAbr5ide6JPhqqhFVj6JOxhl6pvq4TiCh+opyF28hyh4WlFPnZb3KTipNDvQGMj53UFKeYOV98GczQJ8udgWRl5bPYTyL/W09ONRfz2HoTVYaNcNOVBKqCO9+rmBD+7NAAlMIdASkQ+iATNfF4pv6gKW4lg+S0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(52116002)(66476007)(4326008)(6506007)(86362001)(2616005)(38100700002)(6666004)(41300700001)(66556008)(8676002)(66946007)(2906002)(316002)(1076003)(44832011)(478600001)(8936002)(83380400001)(7416002)(6512007)(5660300002)(966005)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VHQjTIoS8A2opovVxFiFqMV875j6dmByl00hxF2IyD1sNsXOVFzpndFOQv+n?=
 =?us-ascii?Q?EoJhmzG7WCCGhz7jIxdGRiPR+cf9mEvcRjxEEddffL21BqFv0IufTYeC5wyI?=
 =?us-ascii?Q?aogipZVCSNg7VhWL1UG/lWmGkW8rRyAMLgH0IIgHeh05jsOUJHptSSbd8yKq?=
 =?us-ascii?Q?3kQGKMPbrFlQCSPmrMrEBtQkjkBqqLJLy9FvsKVf9jNS/zxjN2Pb+JgHILC3?=
 =?us-ascii?Q?YPSPhDM3al7tMca0YYl2L3WvbHHtAPTbCaSsataKNqzMPfZCk/FOckEF+MMx?=
 =?us-ascii?Q?58/xr6CPeHCeaN8esNdbOPxvVE1U474e/lhrqRnXRHQYE5OV+TkHL5NLDjuD?=
 =?us-ascii?Q?cPXCF6uNhBLAJW2E+k3UVKbtkbH2tHcoSRfVgE/1nuGhz32Qj6+Fa3WajgAv?=
 =?us-ascii?Q?CzhcKGGCzvShWVsVRHvZijvQXtlt4TZ/cLqUhtToMt3DJicCIUnAU31BNa0N?=
 =?us-ascii?Q?XIIN+LSvdS1qW3MpQ78w/TwKsaI1UTUwBRLLiB3hTvToe1gamYcXvF20v3dI?=
 =?us-ascii?Q?L6vDaGTVoFZeQNpRBLb6dg9HWcv7b/3F3yzdZQDOvIeJ0PwrLQMypCsY/9Hg?=
 =?us-ascii?Q?G12GHlBx4yrW8jwWTk8Sv094Ma4lnNh0S7PXltLn8CdsaUWdTJbw9SB9EaRJ?=
 =?us-ascii?Q?8imDcpiKpk34al+BIwjuW+hMlMC7F0C1v2+xS/ogFC2RkRtv7ZW01Syow2sN?=
 =?us-ascii?Q?SVruxrROoXgO6oacc7BiimvvVkSyO/yfjIsNY/0Znxm8AD2/q+dP82LowJxN?=
 =?us-ascii?Q?83+VbpRkbz+80wRtsWSVqIiZY6xwrQ2ZX6xkbDnPW03Bs9CDgld+YtorgzEn?=
 =?us-ascii?Q?DtLEkjKujEZwzl3ebZwCPkg+pcw8S6nkAemUiYdilcgJMTwxWH358iMc/70Q?=
 =?us-ascii?Q?xsSisrHCZ1JT3fd6lo9qyjo0Swz7vlj2prTKSWFc3XI8wb7uRJtRTE/hAPTa?=
 =?us-ascii?Q?jJ3t+TL2mB+ShdVEu3UClYv2x6fpdOG53548QmFzjt+sBy806vg5DODW08St?=
 =?us-ascii?Q?BCKv0V/P8FG6D6MAEl8H7Tba2xg5LvWJkyNLYU8K0CZqlxZ4Xlq/fqy+UW+q?=
 =?us-ascii?Q?7xNbCwJgLCVKG8R1r9fC/xWugXuEt95jDyzZrRGF3wBbkGKSWyUBtB0ySDvH?=
 =?us-ascii?Q?NsA49U83yVPTMZQGLZJ2t5EMMD70Qy26OncPb8qeWnp3GGgzVlaC/kDeFDoT?=
 =?us-ascii?Q?WCjkv5yNggYF134OWZiyeLETky3arCq0R57xo2MtfSOw/O+fr4ZgkShI2uQN?=
 =?us-ascii?Q?ERleLjV+ndIu6wNtsN/5OGTIXwjPjlnpcaQ8FVjwxqAnTDmyq0u5oKB6eHkY?=
 =?us-ascii?Q?LhwNZGVRzBj/Sig2wm2h57vu+Ozz1Wsh2DeSXn3G9q7oO2ASny2cgXAk8eWq?=
 =?us-ascii?Q?QzOZBCwO6UYF9oMPrOV5+Odn3a24p8AWvWkxYT0ZRGB/1BusZOQxuFS3hOw7?=
 =?us-ascii?Q?R4xLvBpA0HCb9URTMO7m9xSxZzYhXwgdE9iMdvE5snSSgQHv5vcjB9nTz5qj?=
 =?us-ascii?Q?NVHMgAVHO5yCNSQv7U5lwA9IUlNligLU4BJ9MCqEL0v/ScIYzU9RxKHLP2La?=
 =?us-ascii?Q?d9luAz//4IM42b0jEVMyvf6r0gZDZx4ibFDBflVwKC0gHibR8gwyRUM2ewHm?=
 =?us-ascii?Q?cS6i+mdxkxlsbuGytZJBzuVuAhUzFfjqe9pepcT4FQdGEgH+eF/rXSbFgzXY?=
 =?us-ascii?Q?h85uKTmXVv18e9d4GHOrPPclpUM8r1akiK8rLR0iexv7tTbvB8Ol7ZhFIFd6?=
 =?us-ascii?Q?ldwpWR3wSdNXL5YPtnhREyhygDMl7OlA0fY3Eft9zQyDvtllA2TSyRagtv4Y?=
X-MS-Exchange-AntiSpam-MessageData-1: 9aE+wApQtkIg86jTZgcRcm7bti+mhMhgWw4=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc8d3994-0c56-494b-9b86-08da5525378d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 14:32:36.2086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yx81t//Y8aXWxujuRSwqRtmBjj4uQGmTHy6e+b7K48+7qVWUO+x1IEmGrFI1hEwWoGdSeUDKJ0o2jTy1wbpUuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2288
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add user documentation for the DW100 driver.

while at it, replace spaces with tab on drivers list.

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/drivers/dw100.rst     | 69 +++++++++++++++++++
 .../userspace-api/media/drivers/index.rst     |  3 +-
 2 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/userspace-api/media/drivers/dw100.rst

diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
new file mode 100644
index 000000000000..1ca6fa55f539
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/dw100.rst
@@ -0,0 +1,69 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+DW100 dewarp driver
+===================
+
+The Vivante DW100 Dewarp Processor IP core found on i.MX8MP SoC applies a
+programmable geometrical transformation on the input image to correct distortion
+introduced by lenses.
+
+The transformation function is exposed by the hardware as a grid map with 16x16
+pixel macroblocks indexed using X, Y vertex coordinates.
+::
+
+                          Image width
+           <--------------------------------------->
+
+      ^    .-------.-------.-------.-------.-------.
+      |    | 16x16 |       |       |       |       |
+   I  |    | pixel |       |       |       |       |
+   m  |    | block |       |       |       |       |
+   a  |    .-------.-------.-------.-------.-------.
+   g  |    |       |       |       |       |       |
+   e  |    |       |       |       |       |       |
+      |    |       |       |       |       |       |
+   h  |    .-------.-------.-------.-------.-------.
+   e  |    |       |       |       |       |       |
+   i  |    |       |       |       |       |       |
+   g  |    |       |       |       |       |       |
+   h  |    .-------.-------.-------.-------.-------.
+   t  |    |       |       |       |       |       |
+      |    |       |       |       |       |       |
+      |    |       |       |       |       |       |
+      v    '-------'-------'-------'-------'-------'
+
+            Grid of Image Blocks for Dewarping Map
+
+
+Each x, y coordinate register uses 16 bits to record the coordinate address in
+an unsigned 12.4 fixed point format (UQ12.4).
+::
+
+    .----------------------.--------..----------------------.--------.
+    |         31~20        | 19~16  ||         15~4         |  3~0   |
+    |       (integer)      | (frac) ||       (integer)      | (frac) |
+    '----------------------'--------''----------------------'--------'
+    <-------------------------------><------------------------------->
+                Y coordinate                     X coordinate
+
+                           Remap Register Layout
+
+The dewarping map is set from applications using the
+V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP control. The control contains
+an array of u32 values storing (x, y) destination coordinates for each
+vertex of the grid. The x coordinate is stored in the 16 LSBs and the y
+coordinate in the 16 MSBs.
+
+The number of elements in the array must match the image size:
+
+.. code-block:: C
+
+    elems = (DIV_ROUND_UP(width, 16) + 1) * (DIV_ROUND_UP(height, 16) + 1);
+
+If the control has not been set by the application, the driver uses an identity
+map.
+
+More details on the DW100 hardware operations can be found in
+*chapter 13.15 DeWarp* of IMX8MP_ reference manual.
+
+.. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPRM
diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 12e3c512d718..0c720ca1a27d 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -33,7 +33,8 @@ For more details see the file COPYING in the source distribution of Linux.
 
 	ccs
 	cx2341x-uapi
-        hantro
+	dw100
+	hantro
 	imx-uapi
 	max2175
 	meye-uapi
-- 
2.36.1

