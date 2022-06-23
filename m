Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0465A557DDE
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 16:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231974AbiFWOcz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 10:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231993AbiFWOcq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 10:32:46 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60050.outbound.protection.outlook.com [40.107.6.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD52C45AC3;
        Thu, 23 Jun 2022 07:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDJ1HYt71CD2xwO58e2mhl0kt1gPAkYClHciKg2ilM45OQDzJeJXwt7ih2v+Lps/BPm2bin60s83Aeu7JhFUt7NZHE1AUV3hpnegx6NjKS2q3wiDQrVpX4+vhArukZ1NvIZWtQoPuV7neofTGPRk3OjQr5czEctBknJz2ZTfivCiFCtQuatiK7dqhXv5kcOZsvaYBoNbH4CiT4pSpzYO70kXlt5fgjCoLj9rYBxYjLwqlpFqcg/bYswBfiT6XtPZsMGLTZCE1GbTvqr6lX95O47inNinzxfeb2yrRp3lk6zPELnML/pKuEBg7e/pM/Ho7jjJGK21RRvGgSe0KtvVnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8s/Cgb9sV9a+MqR7FU9scBugSxVonky71LBOV83KLs=;
 b=EOFzdNp6OaUkeGJ/ivQ655+yAa+TwetE7M7Gn8UPtofmfUvceYgkTUB6onDrjHktKm8SEt4fod95OpPSpFe9lAMkF53JbuWGol6Qs9c2eYkMP3ATXNmZiR6N/uupOJGarpCjtlrv/iweubcM1ht+ZCDZuZD+75h3SEdif1va7U6iYpab4I28ckA4QqMpIgtusmjYO8f+SPDac0JZTQnsehxTgf6tsh56VP+bvZoSwr+2UwL/6mb0gbjcEgH2L2N56sE38tmO0qD6Ccs2nxOuW+3i6P7Lt7ZntZgy3gzQAXBVLvkEySwDAlDUNDMYvAifVnw3Mq4eGaaqtgqeUqaUEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8s/Cgb9sV9a+MqR7FU9scBugSxVonky71LBOV83KLs=;
 b=cqTkJCS0uw6hdPzsKbqX6nxx7vW+52Jn7jlJ7W3gCnRNuQZa8CgAtxZyjttYQh4mhOX/sBuoZOMS3iZH46AOSJCKMiVshqjCHWJYahqGAJ5vh9PAWuA7rdm8TFizY0NcFTT2Qq4xc5S3J0tdKrdwOV/MenDfGVpusqrQCMwbKjc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by VI1PR0401MB2288.eurprd04.prod.outlook.com (2603:10a6:800:28::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 23 Jun
 2022 14:32:37 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485%5]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 14:32:37 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v6 11/14] media: uapi: Add a control for DW100 driver
Date:   Thu, 23 Jun 2022 16:31:12 +0200
Message-Id: <20220623143115.3185297-12-xavier.roumegue@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: a7fdf33f-94af-4426-8ce5-08da55253828
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2288:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2288275B783FB7D7E5F74AB9BAB59@VI1PR0401MB2288.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mcd8KPVDOZBgFKBgZtkLNxxbOENuV2JCR3QSCGtSnOvcC0mzLh2S5MCnaeYYoHSyifsiS5bpClckB70wMRVik3ppFF9nYazrxS/PNbXiCRxmQbDDN0fmLTNppBSDl8M9AdHzQn1MNKygIPljn7AFWKMcWGFxCg1Ui+0f+QJY/tfRYGo/XWZA3emFWo1VY6Ui1xEFu7epb+TjbHexQ1YH2N4awJzLZX5pPLllU6NtwKzjRQ+7gPqx4VHi0Lty44W7N5t5A4sjUUlIbVnHxMm22NJj6oM4SGmMzYkVeoOw+bU7LIjf/44QPSaovobPMf5gQWRMN5WC9D4/cOJcz8uFuYVCfharBFItHM0k04Z/kf0UtRQxyz/Vh3nbaIZAjrSQ9szgif04UdkJrGODmY4XtVZ2mjcTa2Dsrvjy96WS5QnDKJiWKDygyZlYWDf71Znh//HnjXhiu/YQUx9cL9s6U4WCqwN0MlG8FhEE3KThValgk1zJac/CB47Im1luoYNj4q/KurNC4JO6+6kgg1GrM/go2oXUUAOgSD8ItDpVeCEr4EOCEFM4xLCCCWgLTDKu/DUEC3F6rlTJmLp7KJCcqkzCtiDDkHcswc7mKQ2+maiPb/f96kS3Dj1BO6eIRP5F7AY+46a9usZF2L9kFpqby+3hxunNrRjHRJ4P0h3JnaVrCHwKG6TmdfJhjCZuRVfIN+0bnsi9KqfSa3B7mpSbD13l3a8PC41UM8G0IdcqvdA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(52116002)(66476007)(4326008)(6506007)(86362001)(2616005)(38100700002)(6666004)(41300700001)(66556008)(8676002)(66946007)(2906002)(316002)(1076003)(44832011)(478600001)(8936002)(83380400001)(7416002)(6512007)(5660300002)(966005)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u5kkgaXjFmOYing+L5BeGCHtZf2MDEz9ONHNmg546w7DHLtl801vTAoRscPy?=
 =?us-ascii?Q?0rqlm1lD4BjdXK43yJBxgncOBwnbplhy/Wjb1HR6K9FwVcgzPpXT4plmMjLq?=
 =?us-ascii?Q?6X1BrUX4QQ95gegRSChB7SmXYdJRrPotYEiRnsZWhMbV7KTK9CH51P72Sabq?=
 =?us-ascii?Q?fj72GTbcfM34TMiDDxz52w3VZ3t+3c+aP/gqTJHVrigsWk+wn89AeYzgJ9uL?=
 =?us-ascii?Q?dcj+YNSfpQl9f1bOYps7KWHroBc+1TKxC6lGYdCP1qTFjTCVYi3uyClTzgLs?=
 =?us-ascii?Q?oCVwNo2K6gx5dMJy3eFvWVGpKtYTu9YEI1dRrIK4WMBnlz/IakAzm5D8ErUK?=
 =?us-ascii?Q?/D7dWCBBO9Baqr+nLIKk6JQtqJy725YaRYFnWHCxYchIRAp0J7NC9WNLOBLK?=
 =?us-ascii?Q?TeEaIU0h0yOS1dRrh/P2FN4h/QXeTJjCmKR79G+uXb4PKKW85g2F4p8fhyyE?=
 =?us-ascii?Q?wMrOX7QY5IhDb0cUqMzSUDYzPmwZj6yMAdDmAmyOKWfSyxewtl7/lpufF8LK?=
 =?us-ascii?Q?yyUh+bQjfQ2E1TVtQBrkd1voTtoiIdjdaOlF434Hu+NjbnR4p8jjLyLWIHvM?=
 =?us-ascii?Q?t960yUFwdPr5mij+orA8o4+9XirbCarypt6eKg05xujYCudqfA1w1u6aYYWH?=
 =?us-ascii?Q?VT/hhAWQP16491aR9RvBTQY6eo8f0PaE5aw7g/rjDs+nUbWWxvbK3sFABEk5?=
 =?us-ascii?Q?Ev4m3yK/rQdf5qq/tsulIdg94RKVy0mr0bA228lDOvqbaJQPRgNWO2Z3GRS4?=
 =?us-ascii?Q?CkB0HUAbXNjc6FbGQLhFMqtKFl4xAsN6B+e+b35HGvZH9eDYcWezytKXXvFt?=
 =?us-ascii?Q?HNo7mKBIzsieHxa949pMS0QV0Njf6FAjG8kXj+RYcDkpp5zKbKV2joqO92EG?=
 =?us-ascii?Q?1Tna4X1Mdn/BIbMmy+qHJVaywNNrl7CEd5jGFuuSsUmLICT7W+fLrU15uXE1?=
 =?us-ascii?Q?9B4cp+xbwg1x5lRQj9UyXmh8T+GJ6D4FFoJRvCM2PABN0JwochYfjgkBymx4?=
 =?us-ascii?Q?LU8nPFi+LPbZBb7PPgT+aFJmCUpvJwGeSmpLcBkxBGThraXJ+5j/HIuqOkmM?=
 =?us-ascii?Q?Ab+OVpDDG5nkNF+AJALG92HKGjHpmcEDLR47G6yjiQ1G9zeK+5AJiTb+vaYH?=
 =?us-ascii?Q?HKqgmZVK5acdYMgn0Bl/L3abbmZsUa3L8NLmPdyH+6KpWFXcyTzqY57Tp700?=
 =?us-ascii?Q?mo+YCGRzmkKwwdO2HBbuyc6OWsfb4J3pVDVLrUVfPSU4jdBsxsTTyGXtON3/?=
 =?us-ascii?Q?Osx2mTzonhHfWNy1DKORtAVnk3HTWJZcnHkIBc8V/NR3cCDABtjWfYZtkvRr?=
 =?us-ascii?Q?+UJZpqOW+irtsXy6sCkNg+HxhtL5zzi4iSsiBki11h5Wa6cChU6jsVE1ZT7H?=
 =?us-ascii?Q?3R1CU2u2xKZFe6qp2ny5Q6hAHBbtFWC7LaEMDthSWQjc/kLQy7pqCGtwI/ox?=
 =?us-ascii?Q?DLJgdfqf7jnXXXNLupQj2dORQe+eFEUPE0+yL89a15mB744x69WxSJZ5XMXH?=
 =?us-ascii?Q?mCL7RzACjFdVZzjkDKPnaWUITvptFirL72oDVZm8NhPQvtUpDi5Bar4iwn7u?=
 =?us-ascii?Q?p48JHTQfg2QvMcR+RfQrgBxr41KpR72csoky/GlDwmicnW2r5KqMH6GK5/br?=
 =?us-ascii?Q?TjtqeYuLzim1eOPEUH3cZlxe7Fe1KlrEhHDfE5Lw1KBPDLOXJEdRf1Fo6dMJ?=
 =?us-ascii?Q?0sU1p2BHyVUs2jBvJFR+Bs7Ei8ZLGmn5Twie+SZNFirF2fyu27Vt0//WgswD?=
 =?us-ascii?Q?Ku6niABkFmp0LYADOG6sDGOnPZKriU2IGyantgm+uJLv80BAIrYi9qNBgEwO?=
X-MS-Exchange-AntiSpam-MessageData-1: 3/mfnlH7UbM1L9YmKsOuBhXQWwiQXwSdEOk=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7fdf33f-94af-4426-8ce5-08da55253828
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 14:32:37.2709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wk6kN8AnS4KiwTU6/78n+NCLCBi+QuHI3qEAL7fuXZqiczjRMVLIzc/FLdOrFr2ZRJlJM3cRH3yyZZ1st9IaDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2288
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/drivers/dw100.rst          | 13 +++++++++++++
 include/uapi/linux/dw100.h                         | 14 ++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 include/uapi/linux/dw100.h

diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
index 1ca6fa55f539..d8a6e10b4395 100644
--- a/Documentation/userspace-api/media/drivers/dw100.rst
+++ b/Documentation/userspace-api/media/drivers/dw100.rst
@@ -66,4 +66,17 @@ map.
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
2.36.1

