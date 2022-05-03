Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 930B551816E
	for <lists+linux-media@lfdr.de>; Tue,  3 May 2022 11:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233798AbiECJog (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 May 2022 05:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234030AbiECJoJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 May 2022 05:44:09 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80087.outbound.protection.outlook.com [40.107.8.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97F0B39150;
        Tue,  3 May 2022 02:40:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djUTkcT2ngopobWcIfz3IUPd64mtcU/pAk85i4jvdYXZ8YB2aF1grnA60MWbgdROStSIwX7s3gipMzCteTnZbNhr2m5tpgQxjFQ5bj4Zri3WQSGxVr93QU4SXJLQLQ0SCDET2VNj2zz5+ikkqwkMsbaNm0SCi3qITGRFiDdX2I5K44rOM2QmgwuXoYjDC3xlLy9xrJFWM5Eb7k+OlQUt47rBUJdHUhXYDjzz6waHPrRAqzX9PUKX7u17QAWf/UKFdaQaKWtc8s1RI1PGOrQh7kmRLrg7TZ43vdQuSswAKhRZ4c4Jw/aK2EbjcGHWXjSJoMJBL8jhaWmjSzJXGzzoYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NueBFtIUBByK/Vyxjm1d/3M6bmtNLWJ5NsidGFOVwLo=;
 b=F5Kk/2xElxbjZfxBea6jtFHooW8BylKc9bmYUnLCX8NxloY9QkPKBeb7IqqJ/tIzIBHJXxhpZ5r1LHIDxhOtXuIhFOJibf15d798PCwyiJfgCy2P6jgRyE2pP+2uuNgehrZBdgDfBEDuOOh8/P9VBuvuzsA2z67M4G3pKMVgOvi6R9GrSJFJoL60gcyTPZ6GCqzUWgskkqf4LGAR82oAKZ6rQ+jPFl2mSGfcKYGZsv9gAeaHduV5qs7SBWyBCKQj/y8Y7VN67w7R//41lD/XI0zYPSA4ttHcVnjZFGMN3RYhjMZnG62L/fzAxukYB8rbLnj0ZOgavYP9p1ixMG/C8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NueBFtIUBByK/Vyxjm1d/3M6bmtNLWJ5NsidGFOVwLo=;
 b=fYKWLCGV9MkHG/490KKmZvIpNz2BAttAqwzxsE10jaD+NvFF/PxMQNM/XrN7aAzDMEO8/s7ICoeXNrQDlhj1ot1NKlvtnA0/RWX5sLPdSNJgOuYNiuRfEcdcj/k87Jnvymtza/f0Cy+Xa2dNa+JnmsQEfi4wNCO/gL3rcpRpcmI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8700.eurprd04.prod.outlook.com (2603:10a6:20b:43f::8)
 by VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 09:39:50 +0000
Received: from AM9PR04MB8700.eurprd04.prod.outlook.com
 ([fe80::9120:6407:db5d:462c]) by AM9PR04MB8700.eurprd04.prod.outlook.com
 ([fe80::9120:6407:db5d:462c%7]) with mapi id 15.20.5206.014; Tue, 3 May 2022
 09:39:50 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 6/9] media: uapi: Add a control for DW100 driver
Date:   Tue,  3 May 2022 11:39:22 +0200
Message-Id: <20220503093925.876640-7-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503093925.876640-1-xavier.roumegue@oss.nxp.com>
References: <20220503093925.876640-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0111.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::27) To AM9PR04MB8700.eurprd04.prod.outlook.com
 (2603:10a6:20b:43f::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eed1a3d9-d6e5-45bf-c53b-08da2ce8deb9
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2559:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2559A4829F5EE49AEE40303EBAC09@VI1PR0401MB2559.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T2KKOERDRUVN4aI3Hxq7yD6EsTt5LO13yVBA2T8Cc97VwuqziVcq7eoINRbuuyO4Rr7vTRtYxamLmePWCgo6PdQW21+HB3jvqgXCjLC28e96nrcsUQAo+gPsUwBRwO4w3gzwsWQhSfr/oLttQw0zCrh5Oizsoq1I8w9zoPFE2VDFXkwhKQ7huiim9rXAWdtUc1UJxAXm2F/b1e9YByt3pWu6Y6M4tYcRrNTIzE+MnE0KSG0YE70vggQnVkktl8YYXiOG96hz29JR+yaly3o+XUrMpCBOWQjmUiPuQm8A19rOXE0awI0wbouA7I4WySSKfS+9jJwNtADw+XtTu3C02/3klDrVo8joZNf9/1NgtbOSkmk5z0xdbSOOfIV5PgIV7IvBw8gUlQ1BGZgIP+jXGBaY1WR+cmQrvi1zWXJSjOI25eR3Sm7OMHhm1nRqFtJE9GrhtnXgQ6LpPBampvPq3HxRjTp0kS+8AIvf0GDNVr/vnqj5T/rbudcQolhoDG9WmNaQUc8d67rev4TVvbZ7oFgddshK2hr2U9cOXpzzzLMr4DOf2fsstBdWndwZrRb3GWFrdZg3820+I0AdAll7xNzQuHtA2XJF7bqR2PzwfW2YlXD/YY5IxJrT4i0WsIPeBVSxENt1gNyDSVTejAbFFz8tN3cizhbm4O3eQlWb2ATsrZmuJMEKDh85WcORsT0GFksMAOoAuZF0tLGfzqn2V7pwbEqDdTMfYot/pwyjUXw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8700.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52116002)(8936002)(83380400001)(508600001)(2906002)(316002)(66946007)(6486002)(2616005)(1076003)(5660300002)(966005)(7416002)(186003)(86362001)(44832011)(8676002)(4326008)(66556008)(66476007)(6506007)(6512007)(6666004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WpYVr+TKcYedfSHDkSuOh7DRs8zRyhR53Ko0iHVyK+cGmxSpYT1LJ1fJ8h9h?=
 =?us-ascii?Q?h9KhFU7cABtk21QBBrcp1n1QUsRuLBoOIDBljczu9AxVMe47if2BqIN2ZIRB?=
 =?us-ascii?Q?PnYyZgulsVmsFfiV2N0+4SGW01kH8NWF0rljX+DYZlVkUMpLdwE7TXlha38f?=
 =?us-ascii?Q?uFCI/U1DyLB4XWvoxosSZt7zyn3XmlZnttwd1bI/cnRfUZ+yxhb44loLFkId?=
 =?us-ascii?Q?uASMu7Wj6iRQexY/bKZidHgR1Q8gQ7YfZhed/sljUbe+zgIEzvNeSnEUZ0iy?=
 =?us-ascii?Q?A+yCYw8+HbpTV7/u7lnmSODig8qpc4k7tkYnsN0LPSueUnEzS3ylCtibIVAv?=
 =?us-ascii?Q?o9A9RR+F8XhiSMAWxJfJVwynOxH01YUg+xZmLwplGPT6DzaOGx2sciEdq5SP?=
 =?us-ascii?Q?jCtQzFL/FwZhZaDR5MC2Qi/jpY+K4h0ubzjGje4shlk7CBH4VMPeBn5rVoQn?=
 =?us-ascii?Q?3OLyNodSmHLOrqkoxxMJ0HHy8YaQ3G+0MVu4/O85GWQMCUwlft3K+VMAuPLd?=
 =?us-ascii?Q?NbBDjwWnIxjth0oHK+EwmNqi+YOSqdEiya76Wq0sIMGdR55ZoH29DBQEYf4L?=
 =?us-ascii?Q?BrKmOfP/ErqrN9ijuDrNSKU1F/QwTLRkZLOeKc3YuOo3mlbg1sqXS+WPpf3X?=
 =?us-ascii?Q?sZipvT4CxqOXFjfkJvH1y0Wq8Tyq5GDQBWthenaXlr7kU2Hi3ISg9icUw+yZ?=
 =?us-ascii?Q?VO8qoJb4f1VfG1vZZIV7Qwv2ITg7YrfMuywcfng2fgqcsQLuTChqsUheNMR7?=
 =?us-ascii?Q?YD8apuHO9lTNYGfQ+618rrbn6Xv0flR8q+quFjU+duPXVMQFKKlai1xwLELd?=
 =?us-ascii?Q?HEpkc2tZ1quVNvYM9HKXBCRJjrvsoHPUQLJfiL1uynz7U8qeRVPWLJSVyU3d?=
 =?us-ascii?Q?7InW5P0cGG2jkAatfSSSWCb2XLd16oR7DOQrdoid50NIUAZSjQ1hmFPV9wiA?=
 =?us-ascii?Q?qwhpOUaQTffQNF5Rk+h3VXjDnr6L/kkoP3IYq/dDFhBNyX/ii6g4V6SC92o5?=
 =?us-ascii?Q?B8+27Q1WVbL6VwZ8qkI4RruzG1McZExcNxGVF1pfpits5TUoGgGkdMad3lz7?=
 =?us-ascii?Q?gN++yr9DctZWKQwnxPYXyoUJlAvlw+7TtFYR7G+OHDrjg+ArSDG/jmZ0bvS4?=
 =?us-ascii?Q?eSfouUwIjXmlQxrWagxIskQJe/XuhCVwELDkvH1A1MOQ8FN0INEUV4JsO61c?=
 =?us-ascii?Q?7O+dbKIu4jNRdhFAz/OtwpC45/nkiRmsb3usSTnW2jq7prTy5zBZ7F9a1Mde?=
 =?us-ascii?Q?1tYKQDlvP9JwcM71LEuBL+fTcdb292gzxjrKHUZDDyPOUGS6GaSVRoHYrYzW?=
 =?us-ascii?Q?DkIq9tYcrTgkOVq288RyUIejANBjzjHX132jjDOmrlit0urmzOKLE7EXCHH9?=
 =?us-ascii?Q?OWJH/F9/K+xq/lWkb3ArLOIzMPgS0Xozl0qUjVEhyoNRzQwBI8BmbvMR+hK5?=
 =?us-ascii?Q?C0FI+a5FYG3W/shNDRpW2R47jWfcVOz0ahEWHep7uETo4YOflpQFgCf1SLmd?=
 =?us-ascii?Q?26RjtX/ZG+iLnjGsSnnUuzyL/aNq0bc5PV0Nwd0naqyT6mZL5mVyHVcEqBvu?=
 =?us-ascii?Q?ubWIJJ8vCjujoF3w68yfnqIVH1fY5txJjJBHS1NtOeU8Hx3SdZTc4WhoRoY+?=
 =?us-ascii?Q?2TXJMi9RD/rkn43eYF/ytZv8Clez+PYVP5OGFP2k4BYU7/6OhnEop34qHjGR?=
 =?us-ascii?Q?GNibyGG1pylwPLNPJ151atXGxZLwexAMB2AqZiV3uAvSqoYfAJBBXDUQZA/8?=
 =?us-ascii?Q?t3JmirEaAZFM0UidCFqNwKJroXdF2FuXugxZfE3dAMfLIZuK3JCYbmMQcchA?=
X-MS-Exchange-AntiSpam-MessageData-1: Gihc7ZrRrksn3PlqZWL1erKUF1vatBjNk30=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eed1a3d9-d6e5-45bf-c53b-08da2ce8deb9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8700.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 09:39:50.8503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oH4xRIyYcJsUA7eWhSYk2LlPC4V1PjP3Eqy+bCC0EFYiK61P5QNugdxMPjNXXQ1M1yLMyjMHB93V6CxVxnSg4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2559
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
 .../userspace-api/media/drivers/dw100.rst          | 13 +++++++++++++
 include/uapi/linux/dw100.h                         | 14 ++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 include/uapi/linux/dw100.h

diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
index 1e606459cf47..1ea727698ea1 100644
--- a/Documentation/userspace-api/media/drivers/dw100.rst
+++ b/Documentation/userspace-api/media/drivers/dw100.rst
@@ -87,4 +87,17 @@ an identity map.
 More details on the DW100 hardware operations can be found in
 *chapter 13.15 DeWarp* of IMX8MP_ reference manual.
 
+The Vivante DW100 m2m driver implements the following driver-specific control:
+
+``V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP (__u32 array)``
+    Specifies to DW100 driver its dewarping map (aka LUT) blob as described in
+    *chapter 13.15.2.3 Dewarping Remap* of IMX8MP_ reference manual as an U32
+    dynamic array. The image is divided into many small 16x16 blocks. If the
+    width/height of the image is not divisible by 16, the size of the
+    rightmost/bottommost block is the remainder. The dewarping map only saves
+    the vertex coordinates of the block. The dewarping grid map is comprised of
+    vertex coordinates for x and y. Each x, y coordinate register uses 16 bits
+    (UQ12.4) to record the coordinate address, with the Y coordinate in the
+    upper bits and X in the lower bits.
+
 .. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPRM
diff --git a/include/uapi/linux/dw100.h b/include/uapi/linux/dw100.h
new file mode 100644
index 000000000000..3356496edd6b
--- /dev/null
+++ b/include/uapi/linux/dw100.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/* Copyright 2022 NXP */
+
+#ifndef __UAPI_DW100_H__
+#define __UAPI_DW100_H__
+
+#include <linux/v4l2-controls.h>
+
+/*
+ * Check Documentation/userspace-api/media/drivers/dw100.rst for control details.
+ */
+#define V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP (V4L2_CID_USER_DW100_BASE + 1)
+
+#endif
-- 
2.35.1

